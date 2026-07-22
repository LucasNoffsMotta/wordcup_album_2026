import 'package:wordcup_album_2026/data/collection_data_service.dart';
import 'package:wordcup_album_2026/data/tradeCardsPair.dart';
import 'package:wordcup_album_2026/models/sticker.dart';

class TradeService {
  late Set<Sticker> cardsAdded;

  Sticker? findCardINeed() {
    return CollectionDataService.collection
        .where(
          (element) => element.ammount == 0 && !cardsAdded.contains(element),
        )
        .firstOrNull;
  }

  Sticker? getIfCardExistOnOtherCollection(
    Sticker neededCard,
    Map<String, Sticker> otherCollection,
  ) {
    if (otherCollection.containsKey(neededCard.toString())) {
      return neededCard;
    }
    return null;
  }

  Sticker? findCardOtherNeed(Map<String, Sticker> otherCollection) {
    return otherCollection.entries
        .where(
          (element) =>
              element.value.ammount == 0 && !cardsAdded.contains(element.value),
        )
        .map((element) => element.value)
        .firstOrNull;
  }

  Sticker? getIfCardExistInMyCollection(Sticker otherCard) {
    return CollectionDataService.collectionMap[otherCard.toString()];
  }

  //Algorithm:
  //Find a card that I need
  //Find out if my friend has that card
  //If he has, keep it
  //Check if aI have a card that my friend neeed
  //Save it
  //Do it again, excluding the saved ones

  List<Tradecardspair>? getTradeDeal(Map<String, Sticker> otherCollection) {
    cardsAdded = {};
    Set<Sticker> cardsSearched = {}; 
    List<Tradecardspair>? tradeCardsDeal = [];
    int maxLoops = CollectionDataService.collection.length;
    int loopCount = 0;

    while (loopCount < maxLoops) {
      Sticker? need = findCardINeed();

      if (need == null) {
        break;
      }

      Sticker? receiveCard = getIfCardExistOnOtherCollection(
        need,
        otherCollection,
      );

      if (receiveCard == null) {
        continue;
      }

      Sticker? cardOtherNeed = findCardOtherNeed(otherCollection);

      if (cardOtherNeed == null) {
        break;
      }

      Sticker? giveCard = getIfCardExistInMyCollection(cardOtherNeed);

      if (giveCard == null) {
        continue;
      }

      tradeCardsDeal.add(Tradecardspair(give: giveCard, receive: receiveCard));
      cardsAdded.add(giveCard);
      cardsAdded.add(receiveCard);
      loopCount++;
    }

    return tradeCardsDeal;
  }
}
