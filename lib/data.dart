import 'package:calculator/lecture.dart';

class Data {
  static List<int> creditList =
      List.generate(10, (index) => index + 1).toList();
  static List<Lecture> lecList = [];

  static void addLec(Lecture temp) {
    lecList.add(temp);
  }

  static double calculate() {
    double totalNotes = 0;
    double totalCredits = 0;

    lecList.forEach((e) {
      totalNotes += (e.creditVal * e.noteVal);
      totalCredits += e.creditVal;
    });

    return totalNotes / totalCredits;
  }

  static String noteToString(double cred) {
    double tmp = cred * 10;
    int tmpcred = tmp.toInt();
    switch (tmpcred) {
      case 40:
        return 'AA';
      case 35:
        return 'BA';
      case 30:
        return 'BB';
      case 25:
        return 'CB';
      case 20:
        return 'CC';
      case 15:
        return 'DC';
      case 10:
        return 'DD';
      case 5:
        return 'FD';
      case 0:
        return 'FF';
      default:
        return 'FF';
    }
  }
}
