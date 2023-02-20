class Lecture {
  final String lecName;
  final double noteVal;
  final int creditVal;

  Lecture(
      {required this.lecName, required this.noteVal, required this.creditVal});
  @override
  String toString() {
    // TODO: implement toString
    return '$lecName $noteVal $creditVal';
  }
}
