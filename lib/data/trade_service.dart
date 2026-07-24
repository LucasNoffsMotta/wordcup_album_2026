import 'dart:collection';

import 'package:wordcup_album_2026/data/collection_data_service.dart';
import 'package:wordcup_album_2026/models/trade_cards_pair.dart';
import 'package:wordcup_album_2026/models/sticker.dart';

class TradeService {
  List<TradeCardsPair>? getTradeDeal(Map<String, Sticker> otherCollection) {
    Queue<Sticker> giveQueue = Queue();
    Queue<Sticker> receiveQueue = Queue();
    List<TradeCardsPair> tradeDeal = [];

    for (var mySticker in CollectionDataService.collection) {
      if (otherCollection.containsKey(mySticker.toString())) {
        var otherSticker = otherCollection[mySticker.toString()];

        if (mySticker.ammount == 0 && otherSticker!.ammount == 1) {
          receiveQueue.addFirst(otherSticker);
        }

        if (mySticker.ammount > 1 && otherSticker!.ammount == 0) {
          giveQueue.addFirst(mySticker);
        }
      }
      continue;
    }

    while (receiveQueue.isNotEmpty && giveQueue.isNotEmpty) {
      tradeDeal.add(
        TradeCardsPair(
          give: giveQueue.removeLast(),
          receive: receiveQueue.removeLast(),
        ),
      );
    }

    return tradeDeal;
  }
}
