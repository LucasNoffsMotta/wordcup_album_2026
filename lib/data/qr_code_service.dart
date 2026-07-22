import 'dart:convert';
import 'dart:io';
import 'package:wordcup_album_2026/data/collection_data_service.dart';
import 'package:wordcup_album_2026/data/tradeCardsPair.dart';
import 'package:wordcup_album_2026/models/sticker.dart';

// Three scenarios:

// Smaller QR Code
// Advantage: Only integer numbers, smaller data to fit in the code
// Disadvantage: A little bit more complex to parse, also will send data that is not usefull (cards with ammount == 1)
// 1 - QR code send all the collection, each position being exactly the position of the card on the array,
// each number scent represents the ammount of that card on the collection. Ex:
// 0, 4, 1, 5, 0 ...

// Larger QR Code:
// Advantage: Only sends usefull data
// Disadvantage: Needs to send a more complex dataset - String

// 2 - System sends two sets of data:
//  1st: Cards with 0 ammount
//  2nd: Cards with ammount > 1

// 3 - Send only the relevant cards:
// 1st number: position of the card (index)
// 2nd number: ammount (0 if needs, 1 if can trade)
// 1.1;2.0;3.1;4.0

class QrCodeTradeService {
  late Set<Sticker> cardsAdded;
  String encodeCollection(List<Sticker> collection) {
    String qrCode = CollectionDataService.getStickersToTradeBitMap(collection);
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

    for (var s in otherCollectionData) {
      List<String> parts = s.split(".");
      var index = parts[0];
      var tradeStatus = parts[1];

      Sticker dummy = CollectionDataService.collection[int.parse(index)];
      Sticker newCard = Sticker(
        id: dummy.id,
        section: dummy.section,
        ammount: (int.parse(tradeStatus) == 0 ? 0 : 1),
        number: dummy.number,
        sectionName: dummy.sectionName,
      );
      otherCollection[dummy.toString()] = newCard;
    }

    return otherCollection;
  }
}
