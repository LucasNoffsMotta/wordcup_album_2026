import 'package:share_plus/share_plus.dart';
import 'package:wordcup_album_2026/data/collection_data_service.dart';

import '../business_rules/screen_filters.dart';

class ExportCardsService {
  static late String exportText;

  static String getExportTxt(Filters filter) {
    String exportTxt = "";
    for (var s in CollectionDataService.collection) {
      if (filter == Filters.missing && s.ammount == 0) {
        if (!exportTxt.contains(s.flagEmoji!)) {
          exportTxt += "\n${s.flagEmoji}\n";
        }
        exportTxt += " ${s.section} ${s.number}, ";
      } else if (filter == Filters.repeated && s.ammount > 1) {
        if (!exportTxt.contains(s.flagEmoji!)) {
          exportTxt += "\n${s.flagEmoji}\n";
        }
        exportTxt += " ${s.section} ${s.number}, ";
      }
    }
    return exportTxt;
  }

  static void export(Filters filter) {
    SharePlus.instance.share(ShareParams(text: getExportTxt(filter)));
  }
}
