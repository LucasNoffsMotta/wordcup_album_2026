import 'package:wordcup_album_2026/models/sticker.dart';

class CollectionDataService {
  static late Map<String, Sticker> collectionMap;
  static late List<Sticker> collection;

  static void createCollectionMap() {
    collectionMap = {
      for (var e in collection)
        e.section.toLowerCase() + e.number.toLowerCase(): e,
    };
  }

  static void setCollection(List<Sticker> col) {
    collection = col;
  }
}
