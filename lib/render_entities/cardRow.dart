import 'package:flutter/material.dart';
import 'package:wordcup_album_2026/models/sticker.dart';

class CardRow extends StatefulWidget {
  final Sticker? sticker;
  const CardRow({
  super.key,
  required Sticker this.sticker}
  );

  @override
  State<StatefulWidget> createState() {
    return CardRowState();
}
}

class CardRowState extends State<CardRow> {

  void incrementStickerCount() {
    setState(() {
          widget.sticker!.ammount += 1;
    });
  }

  Color setCardColor() {
      if(widget.sticker!.ammount == 0) {
        return Colors.blueGrey;
      }

      else if(widget.sticker!.ammount == 1) {
        return const Color.fromARGB(255, 170, 240, 170);
      }

      else {
        return const Color.fromARGB(255, 228, 138, 138);
      }
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
      color: const Color.fromARGB(255, 213, 247, 255), // Your border color
      width: 2.0,         // Border thickness
    ),
        borderRadius: BorderRadius.circular(90)
      ),
      color: setCardColor(),
      child: InkWell(
            splashColor: const Color.fromARGB(255, 236, 215, 150),
            onTap: incrementStickerCount,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.sticker!.number.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    '${widget.sticker!.ammount}',
                    style: const TextStyle(
                      fontSize: 9,
                      color: Colors.black),
                  ),
                ]
              ),
              ),
    ));

  }
}

