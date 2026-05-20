import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:wordcup_album_2026/backend/shared_preferences.dart';
import 'package:wordcup_album_2026/core/theme/app_theme.dart';
import 'package:wordcup_album_2026/models/sticker.dart';
import 'package:wordcup_album_2026/screens/collection_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  List<Sticker>? collection;

  List<Sticker> createNewCollection() {
    List<Sticker> stickers = [];
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
      stickers,
      CountryFlag.fromCountryCode('AX', theme: mainTheme),
      '🏛️',
    );

    insertTeamSection(
      1,
      'MEX',
      20,
      "México",
      stickers,
      CountryFlag.fromCountryCode('MEX', theme: mainTheme),
      '🇲🇽',
    );

    insertTeamSection(
      1,
      'RSA',
      20,
      "África do Sul",
      stickers,
      CountryFlag.fromCountryCode('ZAF', theme: mainTheme),
      '🇿🇦',
    );

    insertTeamSection(
      1,
      'KOR',
      20,
      "Coreia do Sul",
      stickers,
      CountryFlag.fromCountryCode('KOR', theme: mainTheme),
      '🇰🇷',
    );

    insertTeamSection(
      1,
      'CZE',
      20,
      "República Tcheca",
      stickers,
      CountryFlag.fromCountryCode('CZE', theme: mainTheme),
      '🇨🇿',
    );

    insertTeamSection(
      1,
      'CAN',
      20,
      "Canadá",
      stickers,
      CountryFlag.fromCountryCode('CAN', theme: mainTheme),
      '🇨🇦',
    );

    insertTeamSection(
      1,
      'BIH',
      20,
      "Bósnia e Herzegovina",
      stickers,
      CountryFlag.fromCountryCode('BIH', theme: mainTheme),
      '🇧🇦',
    );

    insertTeamSection(
      1,
      'QAT',
      20,
      "Catar",
      stickers,
      CountryFlag.fromCountryCode('QAT', theme: mainTheme),
      '🇶🇦',
    );

    insertTeamSection(
      1,
      'SUI',
      20,
      "Suíça",
      stickers,
      CountryFlag.fromCountryCode('CHE', theme: mainTheme),
      '🇨🇭',
    );

    insertTeamSection(
      1,
      'BRA',
      20,
      "Brasil",
      stickers,
      CountryFlag.fromCountryCode('BRA', theme: mainTheme),
      '🇧🇷',
    );

    insertTeamSection(
      1,
      'MAR',
      20,
      "Marrocos",
      stickers,
      CountryFlag.fromCountryCode('MAR', theme: mainTheme),
      '🇲🇦',
    );

    insertTeamSection(
      1,
      'HAI',
      20,
      "Haiti",
      stickers,
      CountryFlag.fromCountryCode('HTI', theme: mainTheme),
      '🇭🇹',
    );

    insertTeamSection(
      1,
      'SCO',
      20,
      "Escócia",
      stickers,
      CountryFlag.fromCountryCode('GB', theme: mainTheme),
      '🏴',
    );

    insertTeamSection(
      1,
      'USA',
      20,
      "Estados Unidos",
      stickers,
      CountryFlag.fromCountryCode('USA', theme: mainTheme),
      '🇺🇸',
    );

    insertTeamSection(
      1,
      'PAR',
      20,
      "Paraguai",
      stickers,
      CountryFlag.fromCountryCode('PRY', theme: mainTheme),
      '🇵🇾',
    );

    insertTeamSection(
      1,
      'AUS',
      20,
      "Austrália",
      stickers,
      CountryFlag.fromCountryCode('AUS', theme: mainTheme),
      '🇦🇺',
    );

    insertTeamSection(
      1,
      'TUR',
      20,
      "Turquia",
      stickers,
      CountryFlag.fromCountryCode('TUR', theme: mainTheme),
      '🇹🇷',
    );

    insertTeamSection(
      1,
      'GER',
      20,
      "Alemanha",
      stickers,
      CountryFlag.fromCountryCode('DEU', theme: mainTheme),
      '🇩🇪',
    );

    insertTeamSection(
      1,
      'CUW',
      20,
      "Curaçao",
      stickers,
      CountryFlag.fromCountryCode('CUW', theme: mainTheme),
      '🇨🇼',
    );

    insertTeamSection(
      1,
      'CIV',
      20,
      "Costa do Marfim",
      stickers,
      CountryFlag.fromCountryCode('CIV', theme: mainTheme),
      '🇨🇮',
    );

    insertTeamSection(
      1,
      'ECU',
      20,
      "Equador",
      stickers,
      CountryFlag.fromCountryCode('ECU', theme: mainTheme),
      '🇪🇨',
    );

    insertTeamSection(
      1,
      'NED',
      20,
      "Países Baixos",
      stickers,
      CountryFlag.fromCountryCode('NLD', theme: mainTheme),
      '🇳🇱',
    );

    insertTeamSection(
      1,
      'JPN',
      20,
      "Japão",
      stickers,
      CountryFlag.fromCountryCode('JPN', theme: mainTheme),
      '🇯🇵',
    );

    insertTeamSection(
      1,
      'SWE',
      20,
      "Suécia",
      stickers,
      CountryFlag.fromCountryCode('SWE', theme: mainTheme),
      '🇸🇪',
    );

    insertTeamSection(
      1,
      'TUN',
      20,
      "Tunísia",
      stickers,
      CountryFlag.fromCountryCode('TUN', theme: mainTheme),
      '🇹🇳',
    );

    insertTeamSection(
      1,
      'BEL',
      20,
      "Bélgica",
      stickers,
      CountryFlag.fromCountryCode('BEL', theme: mainTheme),
      '🇧🇪',
    );

    insertTeamSection(
      1,
      'EGY',
      20,
      "Egito",
      stickers,
      CountryFlag.fromCountryCode('EGY', theme: mainTheme),
      '🇪🇬',
    );

    insertTeamSection(
      1,
      'IRN',
      20,
      "Irã",
      stickers,
      CountryFlag.fromCountryCode('IRN', theme: mainTheme),
      '🇮🇷',
    );

    insertTeamSection(
      1,
      'NZL',
      20,
      "Nova Zelândia",
      stickers,
      CountryFlag.fromCountryCode('NZL', theme: mainTheme),
      '🇳🇿',
    );

    insertTeamSection(
      1,
      'ESP',
      20,
      "Espanha",
      stickers,
      CountryFlag.fromCountryCode('ESP', theme: mainTheme),
      '🇪🇸',
    );

    insertTeamSection(
      1,
      'CPV',
      20,
      "Cabo Verde",
      stickers,
      CountryFlag.fromCountryCode('CPV', theme: mainTheme),
      '🇨🇻',
    );

    insertTeamSection(
      1,
      'KSA',
      20,
      "Arábia Saudita",
      stickers,
      CountryFlag.fromCountryCode('SAU', theme: mainTheme),
      '🇸🇦',
    );

    insertTeamSection(
      1,
      'URU',
      20,
      "Uruguai",
      stickers,
      CountryFlag.fromCountryCode('URY', theme: mainTheme),
      '🇺🇾',
    );

    insertTeamSection(
      1,
      'FRA',
      20,
      "França",
      stickers,
      CountryFlag.fromCountryCode('FRA', theme: mainTheme),
      '🇫🇷',
    );

    insertTeamSection(
      1,
      'SEN',
      20,
      "Senegal",
      stickers,
      CountryFlag.fromCountryCode('SEN', theme: mainTheme),
      '🇸🇳',
    );

    insertTeamSection(
      1,
      'IRQ',
      20,
      "Iraque",
      stickers,
      CountryFlag.fromCountryCode('IRQ', theme: mainTheme),
      '🇮🇶',
    );

    insertTeamSection(
      1,
      'NOR',
      20,
      "Noruega",
      stickers,
      CountryFlag.fromCountryCode('NOR', theme: mainTheme),
      '🇳🇴',
    );

    insertTeamSection(
      1,
      'ARG',
      20,
      "Argentina",
      stickers,
      CountryFlag.fromCountryCode('ARG', theme: mainTheme),
      '🇦🇷',
    );

    insertTeamSection(
      1,
      'ALG',
      20,
      "Argélia",
      stickers,
      CountryFlag.fromCountryCode('DZA', theme: mainTheme),
      '🇩🇿',
    );

    insertTeamSection(
      1,
      'AUT',
      20,
      "Áustria",
      stickers,
      CountryFlag.fromCountryCode('AUT', theme: mainTheme),
      '🇦🇹',
    );

    insertTeamSection(
      1,
      'JOR',
      20,
      "Jordânia",
      stickers,
      CountryFlag.fromCountryCode('JOR', theme: mainTheme),
      '🇯🇴',
    );

    insertTeamSection(
      1,
      'POR',
      20,
      "Portugal",
      stickers,
      CountryFlag.fromCountryCode('PRT', theme: mainTheme),
      '🇵🇹',
    );

    insertTeamSection(
      1,
      'USB',
      20,
      "Uzbequistão",
      stickers,
      CountryFlag.fromCountryCode('UZB', theme: mainTheme),
      '🇺🇿',
    );

    insertTeamSection(
      1,
      'COL',
      20,
      "Colômbia",
      stickers,
      CountryFlag.fromCountryCode('COL', theme: mainTheme),
      '🇨🇴',
    );

    insertTeamSection(
      1,
      'ENG',
      20,
      "Inglaterra",
      stickers,
      CountryFlag.fromCountryCode('GB', theme: mainTheme),
      '🏴',
    );

    insertTeamSection(
      1,
      'CRO',
      20,
      "Croácia",
      stickers,
      CountryFlag.fromCountryCode('HRV', theme: mainTheme),
      '🇭🇷',
    );

    insertTeamSection(
      1,
      'GHA',
      20,
      "Gana",
      stickers,
      CountryFlag.fromCountryCode('GHA', theme: mainTheme),
      '🇬🇭',
    );

    insertTeamSection(
      1,
      'PAN',
      20,
      "Panamá",
      stickers,
      CountryFlag.fromCountryCode('PAN', theme: mainTheme),
      '🇵🇦',
    );

    insertTeamSection(
      9,
      'FWC',
      19,
      "Museu Fim",
      stickers,
      CountryFlag.fromCountryCode('AX', theme: mainTheme),
      '🏛️',
    );
    return stickers;
  }

  Future<void> insertTeamSection(
    int firstNumber,
    String name,
    int sectionSize,
    String countryName,
    List<Sticker> stickers,
    CountryFlag flag,
    String flagEmoji,
  ) async {
    int n = firstNumber;
    while (n <= sectionSize) {
      Sticker sticker = Sticker(
        section: name,
        ammount: SharedPrefs.instance.getInt(name + n.toString()) ?? 0,
        number: n.toString(),
        sectionName: countryName,
        flag: flag,
        flagEmoji: flagEmoji,
      );

      stickers.add(sticker);
      n++;
    }
  }

  @override
  void initState() {
    super.initState();
    collection = createNewCollection();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors!.bgColor,
        border: Border.all(color: colors.borderColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CollectionScreen(collection: collection!),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(overlayColor: Colors.amber),
                label: Text(
                  'New Collection',
                  style: TextStyle(
                    backgroundColor: colors.surfaceColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: colors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              ElevatedButton.icon(
                onPressed: null,
                style: ElevatedButton.styleFrom(overlayColor: Colors.amber),
                label: Text(
                  'Load Collection',
                  style: TextStyle(
                    backgroundColor: colors.surfaceColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: colors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
