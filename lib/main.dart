import 'package:calculator/defaults.dart';
import 'package:calculator/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Defaults.mainColor,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      title: 'GPA Calculator',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      color: Defaults.mainColor,
    );
  }
}
