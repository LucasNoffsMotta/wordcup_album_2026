import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wordcup_album_2026/models/sticker.dart';
import 'package:wordcup_album_2026/render_entities/countrySection.dart';

enum Filters { all, missing, repeated, alphabetical }

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
  List<Sticker>? currentSelection;
  late Map<String, List<CountrySection>> sectionsMap;
  Filters filter = Filters.all;
  bool allBtnSelected = false;
  bool remainingBtnSelected = false;
  bool toChangeBtnSelected = false;
  bool sortByAlphaBtnSelected = false;
  CollectionScreen({super.key, required this.collection});

  @override
  State<StatefulWidget> createState() {
    return CollectionScreenState();
  }
}

class CollectionScreenState extends State<CollectionScreen> {
  void setFilter(Filters filter) {
    setState(() {
      widget.filter = filter;

      if (filter == Filters.all) {
        widget.currentSelection = List.from(widget.collection);
      } else if (filter == Filters.missing) {
        widget.currentSelection = widget.collection
            .where((e) => e.ammount == 0)
            .toList();
      } else if (filter == Filters.repeated) {
        widget.currentSelection = widget.collection
            .where((e) => e.ammount > 1)
            .toList();
      } else if (filter == Filters.alphabetical) {
        widget.currentSelection = List.from(widget.currentSelection!)
          ..sort((a, b) {
            int result = a.section.compareTo(b.section);
            if (result == 0) {
              result = int.parse(a.number).compareTo(int.parse(b.number));
            }
            return result;
          });
      }
      createSections();
    });
  }

  void setSelectedBtn(int btn) {
    setState(() {
      if (btn == 1) {
        widget.allBtnSelected = true;
        widget.remainingBtnSelected = false;
        widget.toChangeBtnSelected = false;
        widget.sortByAlphaBtnSelected = false;
      }

      if (btn == 2) {
        widget.allBtnSelected = false;
        widget.remainingBtnSelected = true;
        widget.toChangeBtnSelected = false;
        widget.sortByAlphaBtnSelected = false;
      }
      if (btn == 3) {
        widget.allBtnSelected = false;
        widget.remainingBtnSelected = false;
        widget.toChangeBtnSelected = true;
        widget.sortByAlphaBtnSelected = false;
      }

      if (btn == 4) {
        widget.allBtnSelected = false;
        widget.remainingBtnSelected = false;
        widget.toChangeBtnSelected = false;
        widget.sortByAlphaBtnSelected = true;
      }
    });
  }

  void createSections() {
    Map<String, String> addedSections = <String, String>{};
    widget.sectionsMap = <String, List<CountrySection>>{};

    for (var sticker in widget.currentSelection!) {
      if (!addedSections.containsKey(sticker.sectionName)) {
        widget.sectionsMap[sticker.sectionName] = [];

        var stickersOfThisSection = widget.collection.where(
          (e) => e.sectionName == sticker.sectionName,
        );

        widget.sectionsMap[sticker.sectionName]!.add(
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
    widget.currentSelection = widget.collection;
    widget.sectionsMap = <String, List<CountrySection>>{};
    createSections();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ...widget.sectionsMap.values
                    .expand((section) => section)
                    .toList(),
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 201, 201, 201),
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setFilter(Filters.all);
                    setSelectedBtn(1);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.allBtnSelected
                        ? Colors.lightGreen
                        : Colors.blue,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.play_circle_fill_rounded),
                      Text('Todas', style: TextStyle(fontSize: 8)),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    setFilter(Filters.missing);
                    setSelectedBtn(2);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.remainingBtnSelected
                        ? Colors.lightGreen
                        : Colors.blue,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.play_circle_outline),
                      Text('Faltando', style: TextStyle(fontSize: 8)),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.toChangeBtnSelected
                        ? Colors.lightGreen
                        : Colors.blue,
                  ),
                  onPressed: () {
                    widget.collection.where((e) => e.ammount > 1).isNotEmpty
                        ? setFilter(Filters.repeated)
                        : null;
                    setSelectedBtn(3);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.layers_rounded),
                      Text('Repetidas', style: TextStyle(fontSize: 8)),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.sortByAlphaBtnSelected
                        ? Colors.lightGreen
                        : Colors.blue,
                  ),
                  onPressed: () {
                    setFilter(Filters.alphabetical);
                    setSelectedBtn(4);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.sort_by_alpha),
                      Text('', style: TextStyle(fontSize: 1)),
                    ],
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
