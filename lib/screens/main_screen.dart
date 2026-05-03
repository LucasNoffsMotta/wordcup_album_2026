import 'package:flutter/material.dart';
import 'package:wordcup_album_2026/core/theme/app_theme.dart';
import 'package:wordcup_album_2026/models/sticker.dart';
import 'package:wordcup_album_2026/screens/collection_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});
  List<Sticker>? collection;

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}


class MainScreenState extends State<MainScreen> {

    List<Sticker> createsTestCollection() {
      List<Sticker> stickers = [];
      int sectionCount = 0;

      for(int i = 0; i <  980; i++) {

          if (i <= 9) {
              stickers.add(Sticker(id: i, section: 'FWC', ammount: 0, number: sectionCount.toString()));
              sectionCount ++;

              if (i == 9){
                sectionCount = 1;
              }
          }

          else if (i > 9 && i <= 29) {
             stickers.add(Sticker(id: i, section: 'MEX', ammount: 0, number: sectionCount.toString()));
             sectionCount++;

             if (i == 29) {
              sectionCount = 1;
             }
          }

            else if (i > 29 && i <= 49) {
             stickers.add(Sticker(id: i, section: 'RSA', ammount: 0, number: sectionCount.toString()));
             sectionCount++;

              if (i == 49) {
              sectionCount = 1;
             }
            }

            else if (i > 49 && i <= 69) {
             stickers.add(Sticker(id: i, section: 'BRA', ammount: 0, number: sectionCount.toString()));
             sectionCount++;

              if (i == 69) {
              sectionCount = 1;
             }
          }
      }
      return stickers;
  }

  @override
  
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();
    widget.collection = createsTestCollection();
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors!.bgColor,
        border: Border.all(color: colors.borderColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Table(
      border: TableBorder.all(), 
      children: [TableRow(
        children: [ElevatedButton.icon(
          onPressed: () {
            // 1. Calling Navigator.push
            Navigator.push(
              context,
              MaterialPageRoute(
                // 2. Building the Stateless Widget and passing data
                builder: (context) => CollectionScreen(collection: widget.collection!),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            overlayColor: Colors.amber 
          ),
          label: Text(
            'New Collection',
            style: TextStyle(
              backgroundColor: colors.surfaceColor,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: colors.textPrimary
            )),
          )]
      ),TableRow(
        children: [ElevatedButton.icon(
          onPressed: null, 
          style: ElevatedButton.styleFrom(
          overlayColor: Colors.amber),
          label: Text(
            'Load Collection',
            style: TextStyle(
              backgroundColor: colors.surfaceColor,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: colors.textPrimary
            )))
      ])],
    ),
    ); 
  }
}