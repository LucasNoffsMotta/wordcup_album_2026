import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wordcup_album_2026/models/sticker.dart';
import 'package:wordcup_album_2026/render_entities/cardRow.dart';

class CollectionScreen extends StatefulWidget {
  final List<Sticker> collection;
  List<Sticker>? currentSelection;
  int filter = 1;
  CollectionScreen({super.key, required this.collection});
  
  @override
  State<StatefulWidget> createState() {
    return CollectionScreenState();
  }
}

class CollectionScreenState extends State<CollectionScreen> {

 void setFilter(int filter) {
  setState(() {
    widget.filter = filter;

    if (filter == 1) {
      widget.currentSelection = List.from(widget.collection);
    } 
    else if (filter == 2) {
      widget.currentSelection =
          widget.collection.where((e) => e.ammount == 0).toList();
    } 
    else if (filter == 3) {
      widget.currentSelection =
          widget.collection.where((e) => e.ammount > 1).toList();
    } 
    else if (filter == 4) {
      widget.currentSelection = List.from(widget.currentSelection!)
      ..sort((a,b) {
        int result = a.section.compareTo(b.section);
        if (result == 0) {
          result = int.parse(a.number).compareTo(int.parse(b.number));
        }
        return result;
      }
      );

    }
  });
}

    @override
    void initState() {
    super.initState();
    widget.currentSelection = List.from(widget.collection);
  }


    @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: GridView.builder(
        padding:  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 0.9, 
        ),
        itemCount: widget.currentSelection!.length,
        itemBuilder: (context, index) {
          int fixedIndex = index == 0 ? 0 : index;
          return CardRow(sticker:widget.currentSelection![fixedIndex]);
        },
      )),
      Container(
      color: Colors.blueGrey,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () {setFilter(1);}, child: Text('Todas')),
          ElevatedButton(onPressed: () {setFilter(2);}, child: Text('Faltando')),
          ElevatedButton(onPressed: () { widget.collection.where((e) => e.ammount > 1).isNotEmpty ? setFilter(3) : null;}, child: Text('Repetidas')),
          ElevatedButton(onPressed: () { setFilter(4);}, child: Text('Ordem alfabetica'))]
      ))
      ],
    );
     
  //  Container(
  //     padding: const EdgeInsets.symmetric(vertical: 80.0),
  //     child: GridView.builder(
  //       padding:  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 0),
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 5,
  //         crossAxisSpacing: 0,
  //         mainAxisSpacing: 0,
  //         childAspectRatio: 0.9, 
  //       ),
  //       itemCount: collection.length,
  //       itemBuilder: (context, index) {
  //         return CardRow(sticker: collection[index]);
  //       },
  //     ),
  //   ); 
  }

}
  