class Texts {
  static bool language_type = false;

  static TXT en = TXT(
      'GPA Calculator',
      'Lecture',
      'Enter a lecture',
      'lecture',
      'lectures',
      'Average',
      'Credit',
      'Note Value',
      'Please Enter a Lecture.',
      'User',
      'User');

  static TXT tr = TXT(
      'Ortalama Hesaplayıcı',
      "Ders İsmi",
      'Ders Giriniz',
      "ders",
      "ders",
      "Ortalama",
      "Kredisi",
      "Not Değeri",
      'Lütfen bir Ders Giriniz.',
      "Kullanıcı",
      "Kullanıcı");
}

class TXT {
  final String mainTitle;
  final String textBoxHint;
  final String resultsUpperEmpty;
  final String resultsUpperOne;
  final String resultsUpperMore;
  final String resultsLower;
  final String listDescrpCredit;
  final String listDescrpNote;
  final String listEmpty;
  final String drawerUser;
  final String drawerEmail;

  TXT(
      this.mainTitle,
      this.textBoxHint,
      this.resultsUpperEmpty,
      this.resultsUpperOne,
      this.resultsUpperMore,
      this.resultsLower,
      this.listDescrpCredit,
      this.listDescrpNote,
      this.listEmpty,
      this.drawerUser,
      this.drawerEmail);
}
