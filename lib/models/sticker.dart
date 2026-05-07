import 'package:country_flags/country_flags.dart';

class Sticker {
  final String number;
  final String section;
  int ammount;
  String countryName;
  CountryFlag? flag;

  Sticker({
  required this.section,
  required this.ammount,
  required this.number,
  required this.countryName,
  this.flag
  }); 
}