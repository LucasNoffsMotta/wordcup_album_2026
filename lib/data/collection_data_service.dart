import 'package:wordcup_album_2026/business_rules/screen_filters.dart';
import 'package:wordcup_album_2026/data/create_collection_helper.dart';
import 'package:wordcup_album_2026/models/sticker.dart';
import 'package:wordcup_album_2026/presentation/widgets/countrySection.dart';

class CollectionDataService {
  static late Map<String, Sticker> collectionMap;
  static List<Sticker> collection = [];
  static List<Sticker> selectedCards = [];
  static Map<String, List<CountrySection>> sectionsMap =
      <String, List<CountrySection>>{};

/// 1 = can trade
/// 2 = can receive
  static String getStickersToTradeBitMap(List<Sticker> collection) {
    List<String> qrRawDataList = [];
    
    for(int i = 0; i < collection.length; i++) {
      if (collection[i].ammount > 1 || collection[i].ammount == 0){ 
        String sData = "$i.${collection[i].ammount == 0 ? "0" : "1"}";
        qrRawDataList.add(sData);
      }
    }

  return qrRawDataList.join(";");
  }

  static void deleteCollection() {
     for (var v in CollectionDataService.collection) {
      v.ammount = 0;
    }
  }

  static void search(String input, Filters current) {
    filter(current);
    selectedCards = selectedCards
        .where(
          (item) => item.section.toLowerCase().contains(input.toLowerCase()),
        )
        .toList();
  }

  static void filter(Filters filter) {
    if (filter == Filters.all) {
      selectedCards = List.from(collection);
    } else if (filter == Filters.missing) {
      selectedCards = collection.where((e) => e.ammount == 0).toList();
    } else if (filter == Filters.repeated) {
      selectedCards = collection.where((e) => e.ammount > 1).toList();
    } else if (filter == Filters.alphabeticalOrder) {
      selectedCards = List.from(selectedCards)
        ..sort((a, b) {
          int result = a.section.compareTo(b.section);
          if (result == 0) {
            result = int.parse(a.number).compareTo(int.parse(b.number));
          }
          return result;
        });
    }
  }

  static void createCollectionMap() {
    collectionMap = {
      for (var e in collection)
        e.section.toLowerCase() + e.number.toLowerCase(): e,
    };
  }

  static void setSectionsToDisplay() {
    Map<String, String> addedSections = <String, String>{};
    sectionsMap = <String, List<CountrySection>>{};

    for (var sticker in selectedCards) {
      if (!addedSections.containsKey(sticker.sectionName)) {
        sectionsMap[sticker.sectionName] = [];

        var stickersOfThisSection = selectedCards.where(
          (e) => e.sectionName == sticker.sectionName,
        );

        sectionsMap[sticker.sectionName]!.add(
          CountrySection(
            cards: stickersOfThisSection.toList(),
            flag: sticker.flag!,
            name: sticker.section,
          ),
        );
        addedSections[sticker.sectionName] = sticker.section;
      }
    }
  }

  static void initCollection() {
    CreateCollectionHelper.createNewCollection(collection);
    selectedCards = collection;
  }
}
