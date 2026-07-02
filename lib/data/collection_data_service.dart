import 'package:wordcup_album_2026/models/sticker.dart';
import 'package:wordcup_album_2026/presentation/widgets/countrySection.dart';

class CollectionDataService {
  static late Map<String, Sticker> collectionMap;
  static late List<Sticker> collection;
  static Map<String, List<CountrySection>> sectionsMap =
      <String, List<CountrySection>>{};


  static void createCollectionMap() {
    collectionMap = {
      for (var e in collection)
        e.section.toLowerCase() + e.number.toLowerCase(): e,
    };
  }

  static void setSectionsToDisplay(List<Sticker> currentSelection) {
    Map<String, String> addedSections = <String, String>{};
    sectionsMap = <String, List<CountrySection>>{};

    for (var sticker in currentSelection) {
      if (!addedSections.containsKey(sticker.sectionName)) {
        sectionsMap[sticker.sectionName] = [];

        var stickersOfThisSection = currentSelection.where(
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

  static void setCollection(List<Sticker> col) {
    collection = col;
  }
}
