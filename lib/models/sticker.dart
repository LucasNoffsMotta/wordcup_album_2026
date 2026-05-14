import 'package:country_flags/country_flags.dart';

class Sticker {
  final String number;
  final String section;
  int ammount;
  String sectionName;
  CountryFlag? flag;
  String? flagEmoji;

  Sticker({
  required this.section,
  required this.ammount,
  required this.number,
  required this.sectionName,
  this.flag,
  this.flagEmoji
  }); 
}