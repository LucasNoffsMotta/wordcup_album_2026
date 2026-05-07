import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wordcup_album_2026/models/sticker.dart';
import 'package:wordcup_album_2026/render_entities/countrySection.dart';

class CollectionScreen extends StatefulWidget {
  final List<Sticker> collection;
  final List<CountrySection> sections;
  List<Sticker>? currentSelection;
  List<CountrySection>? currentSections;
  int filter = 1;
  bool allBtnSelected = false;
  bool remainingBtnSelected = false;
  bool toChangeBtnSelected = false;
  bool sortByAlphaBtnSelected = false;
  CollectionScreen({
    super.key,
    required this.collection,
    required this.sections,
  });

  @override
  State<StatefulWidget> createState() {
    return CollectionScreenState();
  }
}

class CollectionScreenState extends State<CollectionScreen> {
  void setSectionFilter(int filter) {
    setState(() {
      widget.filter = filter;

      if (filter == 1) {
        widget.currentSections = widget.sections;
      } else if (filter == 2) {
        widget.currentSections = [];
        for (var section in widget.sections) {
          var filteredCards = section.cards
              .where((e) => e.ammount == 0)
              .toList();

          if (filteredCards.isNotEmpty) {
            widget.currentSections!.add(section);
          }
        }
      }
    });
  }

  void setFilter(int filter) {
    setState(() {
      widget.filter = filter;

      if (filter == 1) {
        widget.currentSelection = List.from(widget.sections);
      } else if (filter == 2) {
        widget.currentSelection = widget.collection
            .where((e) => e.ammount == 0)
            .toList();
      } else if (filter == 3) {
        widget.currentSelection = widget.collection
            .where((e) => e.ammount > 1)
            .toList();
      } else if (filter == 4) {
        widget.currentSelection = List.from(widget.currentSelection!)
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

  void createSections() {}

  @override
  void initState() {
    super.initState();
    widget.currentSections = widget.sections;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Column(
        children: [
          Expanded(child: ListView(children: [...widget.currentSections!])),
          Container(
            color: const Color.fromARGB(255, 201, 201, 201),
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setSectionFilter(1);
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
                    setSectionFilter(2);
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
                        ? setFilter(3)
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
                    setFilter(4);
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
