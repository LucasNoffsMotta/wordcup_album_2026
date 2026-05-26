import 'dart:core';

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wordcup_album_2026/models/sticker.dart';
import 'package:wordcup_album_2026/render_entities/countrySection.dart';

enum Filters { all, missing, repeated, alphabeticalOrder }

/* 
Main principle:

O widget NAO pode receber uma lista composta por outros widgets,
recebe apenas DADOS

Ele ira criar os widgets internamente

Collection Screen
Filtros sao aplicados na lista de stickers como um todo
Monta as sessoes com base na lista total de stickers

Sequencia logica SEMPRE:
Stickers -> Filtra -> Monta Sections para exibir
*/

class CollectionScreen extends StatefulWidget {
  //List os stickers:
  final List<Sticker> collection;
  late Map<String, Sticker> collectionMap;
  CollectionScreen({super.key, required this.collection});

  @override
  State<StatefulWidget> createState() {
    return CollectionScreenState();
  }
}

class CollectionScreenState extends State<CollectionScreen> {
  List<Sticker>? currentSelection;
  late Map<String, List<CountrySection>> sectionsMap;
  late List<CollapsibleItem> _items;
  Filters filter = Filters.all;
  bool allBtnSelected = false;
  bool remainingBtnSelected = false;
  bool toChangeBtnSelected = false;
  bool sortByAlphaBtnSelected = false;
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  Future<void> _displayImportDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Importar por texto'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(
              hintText: "Formato exemplo: FWC1, FWC2, FWC3, MEX1",
            ),
            autofocus: true, // Automatically opens keyboard
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                tryAddCollectionByString(
                  _textFieldController.text,
                ); // Process input
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Todas',
        icon: Icons.play_circle_fill_rounded,
        onPressed: () {
          setFilter(Filters.all);
          setSelectedBtn(Filters.all);
        },
        isSelected: true,
      ),

      CollapsibleItem(
        text: "Faltando",
        icon: Icons.play_circle_outline,
        onPressed: () {
          setFilter(Filters.missing);
          setSelectedBtn(Filters.missing);
        },
        isSelected: false,
      ),
      CollapsibleItem(
        text: "Repetidas",
        icon: Icons.layers_rounded,
        onPressed: () {
          setFilter(Filters.repeated);
          setSelectedBtn(Filters.repeated);
        },
        isSelected: false,
      ),
      CollapsibleItem(
        text: "Ordenar",
        icon: Icons.sort_by_alpha,
        onPressed: () {
          setFilter(Filters.alphabeticalOrder);
          setSelectedBtn(Filters.alphabeticalOrder);
        },
        isSelected: false,
      ),
      CollapsibleItem(
        text: "Exportar",
        icon: Icons.share,
        onPressed: () {
          SharePlus.instance.share(ShareParams(text: _exportTxt()));
        },
        isSelected: false,
      ),
      CollapsibleItem(
        text: "Importar",
        icon: Icons.import_export,
        onPressed: () {
          _displayImportDialog(context);
        },
        isSelected: false,
      ),
      CollapsibleItem(
        text: "Deletar",
        icon: Icons.delete,
        onPressed: () {
          _deleteCollectionDialog();
        },
        isSelected: false,
      ),
    ];
  }

  void setFilter(Filters filter) {
    setState(() {
      this.filter = filter;

      if (filter == Filters.all) {
        currentSelection = List.from(widget.collection);
      } else if (filter == Filters.missing) {
        currentSelection = widget.collection
            .where((e) => e.ammount == 0)
            .toList();
      } else if (filter == Filters.repeated) {
        currentSelection = widget.collection
            .where((e) => e.ammount > 1)
            .toList();
      } else if (filter == Filters.alphabeticalOrder) {
        currentSelection = List.from(currentSelection!)
          ..sort((a, b) {
            int result = a.section.compareTo(b.section);
            if (result == 0) {
              result = int.parse(a.number).compareTo(int.parse(b.number));
            }
            return result;
          });
      }
    });
  }

  void _deleteCollectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Atenção",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          content: Text(
            "Deseja reiniciar a colecão do zero?",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancelar"),
            ),
            TextButton(
              child: Text("Ok"),
              onPressed: () {
                setState(() {
                  _deleteCollection();
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }

  void search(String input) {
    if (input.isEmpty) {
      setFilter(Filters.all);
    } else {
      setState(() {
        currentSelection = currentSelection!
            .where(
              (item) =>
                  item.section.toLowerCase().contains(input.toLowerCase()),
            )
            .toList();
      });
    }
  }

  String _exportTxt() {
    String exportTxt = "";
    for (var s in currentSelection!) {
      if (!exportTxt.contains(s.flagEmoji!)) {
        exportTxt += "\n${s.flagEmoji}\n";
      }
      exportTxt += " ${s.section} ${s.number}, ";
    }
    return exportTxt;
  }

  void _deleteCollection() {
    for (var v in widget.collection) {
      v.ammount = 0;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Figurinhas zeradas com sucesso!")));
  }

  //TODO: Improve the complexity time on this (on2)!
  void tryAddCollectionByString(String input) {
    bool added = false;

    if (input.length >= 4) {
      var toLower = input.toLowerCase();
      var splitPieces = toLower.split(",");

      List<String> trimmedList = splitPieces.map((str) => str.trim()).toList();

      setState(() {
        for (var piece in trimmedList) {
          if (widget.collectionMap.containsKey(piece)) {
            added = true;
            widget.collectionMap[piece]!.ammount++;
          }
        }

        String snackBarContent = added
            ? "Adicionado com sucesso!"
            : "Nenhum match encontrado";
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(snackBarContent)));
      });
    }
  }

  void setSelectedBtn(Filters filter) {
    setState(() {
      if (filter == Filters.all) {
        allBtnSelected = true;
        remainingBtnSelected = false;
        toChangeBtnSelected = false;
        sortByAlphaBtnSelected = false;
      }

      if (filter == Filters.missing) {
        allBtnSelected = false;
        remainingBtnSelected = true;
        toChangeBtnSelected = false;
        sortByAlphaBtnSelected = false;
      }
      if (filter == Filters.repeated) {
        allBtnSelected = false;
        remainingBtnSelected = false;
        toChangeBtnSelected = true;
        sortByAlphaBtnSelected = false;
      }

      if (filter == Filters.alphabeticalOrder) {
        allBtnSelected = false;
        remainingBtnSelected = false;
        toChangeBtnSelected = false;
        sortByAlphaBtnSelected = true;
      }
    });
  }

  void createSections() {
    Map<String, String> addedSections = <String, String>{};
    sectionsMap = <String, List<CountrySection>>{};

    for (var sticker in currentSelection!) {
      if (!addedSections.containsKey(sticker.sectionName)) {
        sectionsMap[sticker.sectionName] = [];

        var stickersOfThisSection = currentSelection!.where(
          (e) => e.sectionName == sticker.sectionName,
        );

        sectionsMap[sticker.sectionName]!.add(
          CountrySection(
            cards: stickersOfThisSection.toList(),
            flag: sticker.flag!,
            name: sticker.section,
          ),
        );
        addedSections[sticker.sectionName] = sticker.section;
      }
    }
  }

  Widget _pageBody(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Column(
        children: [
          SearchBar(
            hintText: "Search...",
            onChanged: (value) => search(value),
            leading: const Icon(Icons.search),
          ),
          Expanded(
            child: ListView(
              children: [...sectionsMap.values.expand((section) => section)],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    currentSelection = widget.collection;
    _items = _generateItems;
    sectionsMap = <String, List<CountrySection>>{};
    widget.collectionMap = {
      for (var e in widget.collection)
        e.section.toLowerCase() + e.number.toLowerCase(): e,
    };
    createSections();
  }

  @override
  Widget build(BuildContext context) {
    createSections();
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: CollapsibleSidebar(
          items: _items,
          toggleTitle: "",
          title: "WC2026",
          onHoverPointer: SystemMouseCursors.click,
          toggleButtonIcon: Icons.arrow_circle_right_outlined,
          titleBackIcon: Icons.arrow_circle_left_outlined,
          collapseOnBodyTap: true,
          minWidth: 80,
          borderRadius: 25,
          selectedIconBox: const Color.fromRGBO(0, 212, 198, 1),
          unselectedIconColor: const Color.fromRGBO(82, 100, 122, 1),
          selectedTextColor: Color.fromRGBO(45, 63, 84, 1),
          selectedIconColor: Color.fromRGBO(0, 76, 148, 1),
          body: _pageBody(context),
          duration: Duration(milliseconds: 2000),
          showTitle: false,
          textStyle: TextStyle(
            fontSize: 22,
            color: const Color.fromARGB(255, 201, 255, 52),
            fontStyle: FontStyle.italic,
          ),
          titleStyle: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
          toggleTitleStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          sidebarBoxShadow: [
            BoxShadow(
              color: Color.fromRGBO(29, 189, 142, 1),
              blurRadius: 15,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
      ),
    );
  }
}
