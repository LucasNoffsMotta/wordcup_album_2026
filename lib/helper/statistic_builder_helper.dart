import 'package:flutter/material.dart';
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
      padding: EdgeInsetsGeometry.only(left: padding),
      child: Row(
        children: [
          getMoneySpentChart(data, padding),
          getCollectionProgressChart(data, padding),
        ],
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
            Text("Gasto estimado: $moneySpent"),
            Text("Total: ${data.totalCardsOwned}"),
            Text("Tenho: ${data.totalCardsOwned}"),
            Text("Repetidas: ${data.doubledCards}"),
            Text("Faltando: ${data.missingCards}"),
            Text("Pacotinhos comprados: ${data.boostersBought}"),
          ],
        )

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
        child: CircularPercentIndicator(
          radius: 130.0,
          animation: true,
          animationDuration: 1200,
          lineWidth: 15.0,
          percent: data.progressionPercentage,
          header: Text(
            "Progresso",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          center: Text(
            "${(data.progressionPercentage * 100).round()}%",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          circularStrokeCap: CircularStrokeCap.butt,
          backgroundColor: Color.fromRGBO(45, 63, 84, 1),
          progressColor: const Color.fromRGBO(0, 212, 198, 1),
        ),
      ),
    );
  }
}
