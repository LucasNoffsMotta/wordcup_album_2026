import 'package:flutter/material.dart';
import 'package:wordcup_album_2026/data/shared_preferences.dart';
import 'package:wordcup_album_2026/models/sticker.dart';

class CardCell extends StatefulWidget {
  final Sticker? sticker;
  const CardCell({super.key, required Sticker this.sticker});

  @override
  State<StatefulWidget> createState() {
    return CardCellState();
  }
}

class CardCellState extends State<CardCell> {
  Future<void> incrementStickerCount() async {
    setState(() {
      widget.sticker!.ammount += 1;
      SharedPrefs.setIntValue(widget.sticker!.section + widget.sticker!.number, widget.sticker!.ammount);
    });
  }

  void decreaseStickerCount() {
    setState(() {
      if (widget.sticker!.ammount >= 1) {
        widget.sticker!.ammount -= 1;
        SharedPrefs.setIntValue(widget.sticker!.section + widget.sticker!.number, widget.sticker!.ammount);
      }
    });
  }

  Color setCardColor() {
    if (widget.sticker!.ammount == 0) {
      return Colors.blueGrey;
    } else if (widget.sticker!.ammount == 1) {
      return const Color.fromARGB(255, 170, 240, 170);
    } else {
      return const Color.fromARGB(255, 228, 138, 138);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Card(
        shape: CircleBorder(
          side: BorderSide(
            color: const Color.fromARGB(
              255,
              213,
              247,
              255,
            ), // Your border color
            width: 1.0, // Border thickness
          ),
        ),
        color: setCardColor(),
        child: InkWell(
          splashColor: const Color.fromARGB(255, 236, 215, 150),
          onTap: incrementStickerCount,
          onLongPress: decreaseStickerCount,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.sticker!.number.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  '${widget.sticker!.ammount}',
                  style: const TextStyle(fontSize: 13, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
