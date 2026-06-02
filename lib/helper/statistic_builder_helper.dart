import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatisticBuilderHelper {
  static const double packagePrice = 7.0;
  static const int cardsPerPackage = 7;
  static const int totalCards = 960;
  static const double totalToFillAlbum =
      (totalCards / cardsPerPackage) * packagePrice;

  static double getCompletionPercentage(int current) {
    return (current / totalCards) * 100;
  }

  static double getSpentAmmount(int totalCards) {
    return totalCards / 7;
  }

  static Widget getSpentAmmountPercentageChart(
    String title,
    double percentage,
  ) {
    return CircularPercentIndicator(
      radius: 130.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 15.0,
      percent: percentage,
      header: Text(
        "Progresso",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      center: Text(
        "${(percentage * 100).round()}%",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: Color.fromRGBO(45, 63, 84, 1),
      progressColor: const Color.fromRGBO(0, 212, 198, 1),
    );
  }
}
