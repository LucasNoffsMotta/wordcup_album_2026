import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:wordcup_album_2026/models/collection_data.dart';

class StatisticBuilderHelper {
  static const double packagePrice = 7.0;
  static const int cardsPerPackage = 7;
  static const int totalCards = 960;
  static const double dividerThickness = 4;
   static const double dividerHeight = 3;
  static const double totalToFillAlbum =
      (totalCards / cardsPerPackage) * packagePrice;

  static CurrencyFormat brlSettings = CurrencyFormat(
    symbol: "RS",
    code: "brl",
    symbolSide: SymbolSide.left,
    thousandSeparator: ".",
    decimalSeparator: ",",
  );

  static double getCompletionPercentage(int current) {
    return current / totalCards;
  }

  static double getSpentAmmount(int totalCards) {
    return (totalCards / cardsPerPackage) * packagePrice;
  }

  static double getBoughtBoosters(int totalCards) {
    return totalCards / cardsPerPackage;
  }

  static Widget getChartsScreenTable(CollectionData data, double padding) {
    return Expanded(
      child: Card(
        color: Color.fromRGBO(14, 21, 27, 1),
        child: Center(
          child: Column(
            children: [
              //getMoneySpentChart(data, padding),
              getCollectionProgressChart(data, padding),
            ],
          ),
        ),
      ),
    );

  }

  static Widget getMoneySpentChart(CollectionData data, double padding) {
    double moneySpent = getSpentAmmount(data.totalCardsOwned);

    return Padding(
      padding: EdgeInsetsGeometry.only(left: padding, right: padding),
      child: Card(
        color: Color.fromRGBO(30, 43, 57, 1),
        shadowColor: Color.fromRGBO(52, 74, 97, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.monetization_on_outlined,
                  color: Color.fromRGBO(0, 255, 238, 1),
                ),
                Text("Gasto estimado"),
                Text(
                  CurrencyFormatter.format(
                    moneySpent,
                    brlSettings,
                    enforceDecimals: true,
                    decimal: 2,
                  ),
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(0, 255, 238, 1),
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
            Divider(height: dividerHeight, thickness: dividerThickness,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.auto_stories, color: Color.fromRGBO(0, 255, 238, 1)),
                Text("Obtidas"),
                Text(
                  "${data.totalCardsOwned}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(0, 255, 238, 1),
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
            Divider(height: dividerHeight, thickness: dividerThickness,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.analytics_outlined,
                  color: Color.fromRGBO(0, 255, 238, 1),
                ),
                Text("Repetidas"),
                Text(
                  "${data.doubledCards}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(0, 255, 238, 1),
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
            Divider(height: dividerHeight, thickness: dividerThickness,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.assessment_outlined,
                  color: Color.fromRGBO(0, 255, 238, 1),
                ),
                Text("Faltando"),
                Text(
                  "${data.missingCards}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(0, 255, 238, 1),
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
            Divider(height: dividerHeight, thickness: dividerThickness,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.auto_awesome_motion_outlined,
                  color: Color.fromRGBO(0, 255, 238, 1),
                ),
                Text("Pacotes comprados"),
                Text(
                  "${data.boostersBought}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(0, 255, 238, 1),
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
            Divider(height: dividerHeight, thickness: dividerThickness,),
          ],
        ),
      ),
    );
  }

  static Widget getCollectionProgressChart(
    CollectionData data,
    double padding,
  ) {
    return Expanded(
      child: Card(
        color: Color.fromRGBO(21, 31, 41, 1),
        shadowColor: Color.fromRGBO(52, 74, 97, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(25),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 25.0, top: 20.0),
                  child: Text(
                    "PROGRESSO DO ALBUM",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            CircularPercentIndicator(
              radius: 75.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 15.0,
              percent: data.progressionPercentage,
              center: Text(
                "${(data.progressionPercentage * 100).round()}%",
                style: GoogleFonts.inter(fontSize: 26, color: Colors.white),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Color.fromRGBO(45, 63, 84, 1),
              progressColor: const Color.fromRGBO(0, 212, 198, 1),
            ),
            SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20.0,
                ), // Adjust the radius here
              ),
              color: Color.fromRGBO(33, 46, 61, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 15),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Faltam",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Color.fromRGBO(146, 171, 197, 1),
                          ),
                        ),
                        TextSpan(
                          text: " ${data.missingCards} ",
                          style: GoogleFonts.inter(
                            color: const Color.fromARGB(255, 0, 207, 214),
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: " figurinhas para completar    ",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Color.fromRGBO(146, 171, 197, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
            SizedBox(height: 15),
            getMoneySpentChart(data, padding),
          ],
        ),
      ),
    );
  }
}
