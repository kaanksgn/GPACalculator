import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Defaults {
  static var mainColor = Colors.pink.shade900;
  static final TextStyle mainText = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: mainColor);
  static const BorderRadius mainBorder = BorderRadius.all(Radius.circular(14));
  static final TextStyle resultsUpper = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: mainColor);
  static final TextStyle resultsAverage = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: mainColor);
  static final TextStyle resultsLower = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w600, color: mainColor);
  static final TextStyle inputText = GoogleFonts.quicksand(
      fontSize: 20, fontWeight: FontWeight.w600, color: mainColor);
  static final TextStyle cardMainText = GoogleFonts.quicksand(
      fontSize: 18, fontWeight: FontWeight.w600, color: mainColor);
  static final TextStyle cardsubText = GoogleFonts.quicksand();
}
