import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:wordcup_album_2026/models/collection_data.dart';

class StatisticBuilderHelper {
  static const double packagePrice = 7.0;
  static const int cardsPerPackage = 7;
  static const int totalCards = 960;
  static const double totalToFillAlbum =
      (totalCards / cardsPerPackage) * packagePrice;

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
    return Padding(
      padding: EdgeInsetsGeometry.only(left: padding / 3),
      child: Card(
        child: Center(
          child: Column(
            children: [
              getMoneySpentChart(data, padding),
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
      padding: EdgeInsetsGeometry.only(left: padding + 15),
      child: Card(
        color: Color.fromRGBO(30, 43, 57, 1),
        shadowColor: Color.fromRGBO(52, 74, 97, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(25),
        ),
        child: Column(
          children: [
            Card(child: Text("Gasto estimado: $moneySpent")),
            Card(child: Text("Total: ${data.totalCardsOwned}")),
            Card(child: Text("Tenho: ${data.totalCardsOwned}")),
            Card(child: Text("Repetidas: ${data.doubledCards}")),
            Card(child: Text("Faltando: ${data.missingCards}")),
            Card(child: Text("Pacotinhos comprados: ${data.boostersBought}")),
          ],
        ),
      ),
    );
  }

  static Widget getCollectionProgressChart(
    CollectionData data,
    double padding,
  ) {
    return Padding(
      padding: EdgeInsetsGeometry.only(left: padding),
      child: Card(
        color: Color.fromRGBO(30, 43, 57, 1),
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
                  padding: EdgeInsetsGeometry.only(left: 20.0, top: 20.0),
                  child: Text(
                    "Progresso do album",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            CircularPercentIndicator(
              radius: 80.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 15.0,
              percent: data.progressionPercentage,
              center: Text(
                "${(data.progressionPercentage * 100).round()}%",
                style: GoogleFonts.inter(fontSize: 50, color: Colors.white),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Color.fromRGBO(45, 63, 84, 1),
              progressColor: const Color.fromRGBO(0, 212, 198, 1),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20.0,
                ), // Adjust the radius here
              ),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.inter(),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Faltam",
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        color: Color.fromRGBO(119, 153, 192, 1),
                      ),
                    ),
                    TextSpan(
                      text: " ${data.missingCards} ",
                      style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 45, 233, 240),
                        fontSize: 23,
                      ),
                    ),
                    TextSpan(
                      text: " figurinhas para completar!",
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        color: Color.fromRGBO(119, 153, 192, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
