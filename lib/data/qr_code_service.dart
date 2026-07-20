import 'dart:convert';
import 'dart:io';
import 'package:wordcup_album_2026/data/collection_data_service.dart';
import 'package:wordcup_album_2026/models/sticker.dart';

class QrCodeTradeService {

    String encodeCollection(){
      String qrCode = CollectionDataService.getStickersToTradeBitMap();
      List<int> stringBytes = utf8.encode(qrCode);
      List<int> gzippedBytes = gzip.encode(stringBytes);
      return base64.encode(gzippedBytes);
  }

  String decodeCollection(String code) {
      List<int> decoded = base64.decode(code);
      List<int> gbytes = gzip.decode(decoded);
      String stickers = utf8.decode(gbytes);
      return stickers;
  }

  //Code Lenght MUST be equal collection length!
  // Example of an expected data: 0.1;1.1;1.0 -> First number: Index of the card // Second number: 0 = needs / 1 = Can trade
  // 1 - Split the code string into each piece data
  // 2 - Parse each piece into index and trade status
  // 3 - Instantiate the card using the index received, assuming that it is exactly the same index of the collection data
  // 4 - Sets the ammount based on the trade status (0 = needs, 1 = can trade)
  // 5 - Put it inside the map using the ID as the key
  Map<String, Sticker> parseCodeToCollection(String code) {
    List<String> otherCollectionData = code.split(";");
    Map<String, Sticker> otherCollection = {};

    for(var s in otherCollectionData) {
      List<String> parts = s.split(".");
      var index = parts[0];
      var tradeStatus = parts[1];
      
      Sticker dummy = CollectionDataService.collection[int.parse(index)];
      Sticker newCard = Sticker(section: dummy.section, ammount: (int.parse(tradeStatus) == 0 ? 0 : 1), number: dummy.number, sectionName: dummy.sectionName);
      otherCollection[dummy.toString()] = newCard;
    }

    return otherCollection;
  }

  List<Sticker> _getFinalTradeCards(Map<String, Sticker> otherCollection ) {
    
  }
}