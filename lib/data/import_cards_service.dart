import 'package:wordcup_album_2026/data/collection_data_service.dart';
import 'package:wordcup_album_2026/data/shared_preferences.dart';

class ImportCardsService {
  ImportCardsService();

  
  bool tryAddCollectionByString(String input) {
    bool added = false;

    if (input.length >= 4) {
      var toLower = input.toLowerCase();
      var splitPieces = toLower.split(",");

      List<String> trimmedList = splitPieces.map((str) => str.trim()).toList();


        for (var piece in trimmedList) {
          if (CollectionDataService.collectionMap.containsKey(piece)) {
            added = true;
            CollectionDataService.collectionMap[piece]!.ammount++;
            SharedPrefs.setIntValue(piece.toUpperCase(), CollectionDataService.collectionMap[piece]!.ammount);
          }
        }
    }

    return added;
  }
}