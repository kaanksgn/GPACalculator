import 'package:calculator/texts/texts.dart';
import 'package:flutter/material.dart';

import 'defaults.dart';

class ShowResults extends StatelessWidget {
  final double avr;
  final int lectCount;
  final TXT allTexts;
  const ShowResults(
      {required this.allTexts,
      required this.avr,
      required this.lectCount,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            lectCount > 0
                ? (lectCount == 1
                    ? '$lectCount ' + allTexts.resultsUpperOne
                    : '$lectCount ' + allTexts.resultsUpperMore)
                : allTexts.resultsUpperEmpty,
            style: Defaults.resultsUpper),
        Text(
          avr >= 0 ? '${avr.toStringAsFixed(2)}' : '0.0',
          style: Defaults.resultsAverage,
        ),
        Text(
          allTexts.resultsLower,
          style: Defaults.resultsLower,
        ),
      ],
    );
  }
}
