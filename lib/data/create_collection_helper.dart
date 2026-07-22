import 'package:country_flags/country_flags.dart';
import 'package:wordcup_album_2026/data/shared_preferences.dart';
import 'package:wordcup_album_2026/models/sticker.dart';

class CreateCollectionHelper {
  CreateCollectionHelper._();

  static void createNewCollection(List<Sticker> collection) {
    const ImageTheme mainTheme = ImageTheme(
      shape: Circle(),
      width: 20,
      height: 20,
    );

    insertTeamSection(
      0,
      'FWC',
      8,
      "Museu Inicio",
      collection,
      CountryFlag.fromCountryCode('AX', theme: mainTheme),
      '🏛️',
    );

    insertTeamSection(
      1,
      'MEX',
      20,
      "México",
      collection,
      CountryFlag.fromCountryCode('MEX', theme: mainTheme),
      '🇲🇽',
    );

    insertTeamSection(
      1,
      'RSA',
      20,
      "África do Sul",
      collection,
      CountryFlag.fromCountryCode('ZAF', theme: mainTheme),
      '🇿🇦',
    );

    insertTeamSection(
      1,
      'KOR',
      20,
      "Coreia do Sul",
      collection,
      CountryFlag.fromCountryCode('KOR', theme: mainTheme),
      '🇰🇷',
    );

    insertTeamSection(
      1,
      'CZE',
      20,
      "República Tcheca",
      collection,
      CountryFlag.fromCountryCode('CZE', theme: mainTheme),
      '🇨🇿',
    );

    insertTeamSection(
      1,
      'CAN',
      20,
      "Canadá",
      collection,
      CountryFlag.fromCountryCode('CAN', theme: mainTheme),
      '🇨🇦',
    );

    insertTeamSection(
      1,
      'BIH',
      20,
      "Bósnia e Herzegovina",
      collection,
      CountryFlag.fromCountryCode('BIH', theme: mainTheme),
      '🇧🇦',
    );

    insertTeamSection(
      1,
      'QAT',
      20,
      "Catar",
      collection,
      CountryFlag.fromCountryCode('QAT', theme: mainTheme),
      '🇶🇦',
    );

    insertTeamSection(
      1,
      'SUI',
      20,
      "Suíça",
      collection,
      CountryFlag.fromCountryCode('CHE', theme: mainTheme),
      '🇨🇭',
    );

    insertTeamSection(
      1,
      'BRA',
      20,
      "Brasil",
      collection,
      CountryFlag.fromCountryCode('BRA', theme: mainTheme),
      '🇧🇷',
    );

    insertTeamSection(
      1,
      'MAR',
      20,
      "Marrocos",
      collection,
      CountryFlag.fromCountryCode('MAR', theme: mainTheme),
      '🇲🇦',
    );

    insertTeamSection(
      1,
      'HAI',
      20,
      "Haiti",
      collection,
      CountryFlag.fromCountryCode('HTI', theme: mainTheme),
      '🇭🇹',
    );

    insertTeamSection(
      1,
      'SCO',
      20,
      "Escócia",
      collection,
      CountryFlag.fromCountryCode('GB', theme: mainTheme),
      '🏴',
    );

    insertTeamSection(
      1,
      'USA',
      20,
      "Estados Unidos",
      collection,
      CountryFlag.fromCountryCode('USA', theme: mainTheme),
      '🇺🇸',
    );

    insertTeamSection(
      1,
      'PAR',
      20,
      "Paraguai",
      collection,
      CountryFlag.fromCountryCode('PRY', theme: mainTheme),
      '🇵🇾',
    );

    insertTeamSection(
      1,
      'AUS',
      20,
      "Austrália",
      collection,
      CountryFlag.fromCountryCode('AUS', theme: mainTheme),
      '🇦🇺',
    );

    insertTeamSection(
      1,
      'TUR',
      20,
      "Turquia",
      collection,
      CountryFlag.fromCountryCode('TUR', theme: mainTheme),
      '🇹🇷',
    );

    insertTeamSection(
      1,
      'GER',
      20,
      "Alemanha",
      collection,
      CountryFlag.fromCountryCode('DEU', theme: mainTheme),
      '🇩🇪',
    );

    insertTeamSection(
      1,
      'CUW',
      20,
      "Curaçao",
      collection,
      CountryFlag.fromCountryCode('CUW', theme: mainTheme),
      '🇨🇼',
    );

    insertTeamSection(
      1,
      'CIV',
      20,
      "Costa do Marfim",
      collection,
      CountryFlag.fromCountryCode('CIV', theme: mainTheme),
      '🇨🇮',
    );

    insertTeamSection(
      1,
      'ECU',
      20,
      "Equador",
      collection,
      CountryFlag.fromCountryCode('ECU', theme: mainTheme),
      '🇪🇨',
    );

    insertTeamSection(
      1,
      'NED',
      20,
      "Países Baixos",
      collection,
      CountryFlag.fromCountryCode('NLD', theme: mainTheme),
      '🇳🇱',
    );

    insertTeamSection(
      1,
      'JPN',
      20,
      "Japão",
      collection,
      CountryFlag.fromCountryCode('JPN', theme: mainTheme),
      '🇯🇵',
    );

    insertTeamSection(
      1,
      'SWE',
      20,
      "Suécia",
      collection,
      CountryFlag.fromCountryCode('SWE', theme: mainTheme),
      '🇸🇪',
    );

    insertTeamSection(
      1,
      'TUN',
      20,
      "Tunísia",
      collection,
      CountryFlag.fromCountryCode('TUN', theme: mainTheme),
      '🇹🇳',
    );

    insertTeamSection(
      1,
      'BEL',
      20,
      "Bélgica",
      collection,
      CountryFlag.fromCountryCode('BEL', theme: mainTheme),
      '🇧🇪',
    );

    insertTeamSection(
      1,
      'EGY',
      20,
      "Egito",
      collection,
      CountryFlag.fromCountryCode('EGY', theme: mainTheme),
      '🇪🇬',
    );

    insertTeamSection(
      1,
      'IRN',
      20,
      "Irã",
      collection,
      CountryFlag.fromCountryCode('IRN', theme: mainTheme),
      '🇮🇷',
    );

    insertTeamSection(
      1,
      'NZL',
      20,
      "Nova Zelândia",
      collection,
      CountryFlag.fromCountryCode('NZL', theme: mainTheme),
      '🇳🇿',
    );

    insertTeamSection(
      1,
      'ESP',
      20,
      "Espanha",
      collection,
      CountryFlag.fromCountryCode('ESP', theme: mainTheme),
      '🇪🇸',
    );

    insertTeamSection(
      1,
      'CPV',
      20,
      "Cabo Verde",
      collection,
      CountryFlag.fromCountryCode('CPV', theme: mainTheme),
      '🇨🇻',
    );

    insertTeamSection(
      1,
      'KSA',
      20,
      "Arábia Saudita",
      collection,
      CountryFlag.fromCountryCode('SAU', theme: mainTheme),
      '🇸🇦',
    );

    insertTeamSection(
      1,
      'URU',
      20,
      "Uruguai",
      collection,
      CountryFlag.fromCountryCode('URY', theme: mainTheme),
      '🇺🇾',
    );

    insertTeamSection(
      1,
      'FRA',
      20,
      "França",
      collection,
      CountryFlag.fromCountryCode('FRA', theme: mainTheme),
      '🇫🇷',
    );

    insertTeamSection(
      1,
      'SEN',
      20,
      "Senegal",
      collection,
      CountryFlag.fromCountryCode('SEN', theme: mainTheme),
      '🇸🇳',
    );

    insertTeamSection(
      1,
      'IRQ',
      20,
      "Iraque",
      collection,
      CountryFlag.fromCountryCode('IRQ', theme: mainTheme),
      '🇮🇶',
    );

    insertTeamSection(
      1,
      'NOR',
      20,
      "Noruega",
      collection,
      CountryFlag.fromCountryCode('NOR', theme: mainTheme),
      '🇳🇴',
    );

    insertTeamSection(
      1,
      'ARG',
      20,
      "Argentina",
      collection,
      CountryFlag.fromCountryCode('ARG', theme: mainTheme),
      '🇦🇷',
    );

    insertTeamSection(
      1,
      'ALG',
      20,
      "Argélia",
      collection,
      CountryFlag.fromCountryCode('DZA', theme: mainTheme),
      '🇩🇿',
    );

    insertTeamSection(
      1,
      'AUT',
      20,
      "Áustria",
      collection,
      CountryFlag.fromCountryCode('AUT', theme: mainTheme),
      '🇦🇹',
    );

    insertTeamSection(
      1,
      'JOR',
      20,
      "Jordânia",
      collection,
      CountryFlag.fromCountryCode('JOR', theme: mainTheme),
      '🇯🇴',
    );

    insertTeamSection(
      1,
      'POR',
      20,
      "Portugal",
      collection,
      CountryFlag.fromCountryCode('PRT', theme: mainTheme),
      '🇵🇹',
    );

    insertTeamSection(
      1,
      'USB',
      20,
      "Uzbequistão",
      collection,
      CountryFlag.fromCountryCode('UZB', theme: mainTheme),
      '🇺🇿',
    );

    insertTeamSection(
      1,
      'COL',
      20,
      "Colômbia",
      collection,
      CountryFlag.fromCountryCode('COL', theme: mainTheme),
      '🇨🇴',
    );

    insertTeamSection(
      1,
      'ENG',
      20,
      "Inglaterra",
      collection,
      CountryFlag.fromCountryCode('GB', theme: mainTheme),
      '🏴',
    );

    insertTeamSection(
      1,
      'CRO',
      20,
      "Croácia",
      collection,
      CountryFlag.fromCountryCode('HRV', theme: mainTheme),
      '🇭🇷',
    );

    insertTeamSection(
      1,
      'GHA',
      20,
      "Gana",
      collection,
      CountryFlag.fromCountryCode('GHA', theme: mainTheme),
      '🇬🇭',
    );

    insertTeamSection(
      1,
      'PAN',
      20,
      "Panamá",
      collection,
      CountryFlag.fromCountryCode('PAN', theme: mainTheme),
      '🇵🇦',
    );

    insertTeamSection(
      9,
      'FWC',
      19,
      "Museu Fim",
      collection,
      CountryFlag.fromCountryCode('AX', theme: mainTheme),
      '🏛️',
    );
  }

  static List<Sticker> createTestCollection() {
    List<Sticker> testCollection = [
      Sticker(
        id: 0,
        section: 'FWC',
        ammount: 0,
        number: 1.toString(),
        sectionName: "Panamá",
      ),
      Sticker(
        id: 0,
        section: 'PAN',
        ammount: 0,
        number: 1.toString(),
        sectionName: "Panamá",
      ),
      Sticker(
        id: 1,
        section: 'PAN',
        ammount: 0,
        number: 2.toString(),
        sectionName: "Panamá",
      ),
    ];

    return testCollection;
  }

  static Future<void> insertTeamSection(
    int firstNumber,
    String name,
    int sectionSize,
    String countryName,
    List<Sticker> collection,
    CountryFlag flag,
    String flagEmoji,
  ) async {
    int n = firstNumber;
    int id = 0;
    while (n <= sectionSize) {
      Sticker sticker = Sticker(
        id: id,
        section: name,
        ammount: SharedPrefs.instance.getInt(name + n.toString()) ?? 0,
        number: n.toString(),
        sectionName: countryName,
        flag: flag,
        flagEmoji: flagEmoji,
      );
      id++;
      collection.add(sticker);
      n++;
    }
  }
}
