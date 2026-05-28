import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:wordcup_album_2026/models/sticker.dart';
import 'package:wordcup_album_2026/render_entities/cardRow.dart';

class CountrySection extends StatefulWidget {
  final List<Sticker> cards;
  final CountryFlag flag;
  final String name;
  const CountrySection({
    super.key,
    required this.cards,
    required this.flag,
    required this.name,
  });

  @override
  State<StatefulWidget> createState() {
    return CountrySectionState();
  }
}

class CountrySectionState extends State<CountrySection> {
  
 @override
Widget build(BuildContext context) {
  return Material(
    child: ExpansionTile(
      initiallyExpanded: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.flag,
          SizedBox(width: 4),
          Text(widget.name),
        ],
      ),
      children: [
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          spacing: 1.0,
          runSpacing: 2.0,
          children: widget.cards
              .map((s) => CardCell(
                    key: ValueKey(s.number),
                    sticker: s,
                  ))
              .toList(),
        )
      ],
    ),
  );
}
}
