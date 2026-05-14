import 'dart:ffi';

import 'package:flutter/material.dart';
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
  CollectionScreen({super.key, required this.collection});

  @override
  State<StatefulWidget> createState() {
    return CollectionScreenState();
  }
}

class CollectionScreenState extends State<CollectionScreen> {
  List<Sticker>? currentSelection;
  late Map<String, List<CountrySection>> sectionsMap;
  Filters filter = Filters.all;
  bool allBtnSelected = false;
  bool remainingBtnSelected = false;
  bool toChangeBtnSelected = false;
  bool sortByAlphaBtnSelected = false;

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

  void tryAddSticker(String input) {
    final snackBar = SnackBar(content: const Text('Adicionado com sucesso!'));
    if (input.length >= 4) {
      setState(() {
        for (var s in widget.collection) {
          String stickerId =
              "${s.section.toLowerCase()}${s.number.toLowerCase()}";

          if (input.toLowerCase() == stickerId) {
            s.ammount++;
          }
        }
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

  @override
  void initState() {
    super.initState();
    currentSelection = widget.collection;
    sectionsMap = <String, List<CountrySection>>{};
    createSections();
  }

  @override
  Widget build(BuildContext context) {
    createSections();
    return SafeArea(
      child: Column(
        children: [
          SearchBar(
            hintText: "Search...",
            onChanged: (value) => search(value),
            leading: const Icon(Icons.search),
          ),
          SearchBar(
            hintText: 'Add sticker',
            leading: const Icon(Icons.add_box_outlined),
            onChanged: (value) =>
                Future.delayed(const Duration(seconds: 2), () {
                  tryAddSticker(value);
                }),
          ),
          Expanded(
            child: ListView(
              children: [...sectionsMap.values.expand((section) => section)],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 201, 201, 201),
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setFilter(Filters.all);
                      setSelectedBtn(Filters.all);
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey,
                      elevation: 10,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(24),
                      backgroundColor: allBtnSelected
                          ? Colors.lightGreen
                          : Colors.blue,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.play_circle_fill_rounded),
                        Text('Todas', style: TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setFilter(Filters.missing);
                      setSelectedBtn(Filters.missing);
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey,
                      elevation: 10,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(24),
                      backgroundColor: remainingBtnSelected
                          ? Colors.lightGreen
                          : Colors.blue,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.play_circle_outline),
                        Text('Faltando', style: TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey,
                      elevation: 10,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(24),
                      backgroundColor: toChangeBtnSelected
                          ? Colors.lightGreen
                          : Colors.blue,
                    ),
                    onPressed: () {
                      setFilter(Filters.repeated);
                      setSelectedBtn(Filters.repeated);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.layers_rounded),
                        Text('Repetidas', style: TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey,
                      elevation: 10,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(24),
                      backgroundColor: sortByAlphaBtnSelected
                          ? Colors.lightGreen
                          : Colors.blue,
                    ),
                    onPressed: () {
                      setFilter(Filters.alphabeticalOrder);
                      setSelectedBtn(Filters.alphabeticalOrder);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.sort_by_alpha),
                        Text('Ordenar', style: TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
