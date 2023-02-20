import 'package:calculator/data.dart';
import 'package:flutter/material.dart';

import 'defaults.dart';

class CreditSelection extends StatefulWidget {
  final Function onSelected;
  const CreditSelection({required this.onSelected, Key? key}) : super(key: key);

  @override
  _CreditSelectionState createState() => _CreditSelectionState();
}

class _CreditSelectionState extends State<CreditSelection> {
  List<int> creditList = Data.creditList;
  int selectedCredit = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          color: Defaults.mainColor.withOpacity(0.3),
          borderRadius: Defaults.mainBorder),
      child: DropdownButton<int>(
        underline: Container(),
        items: creditList.map((e) {
          return DropdownMenuItem(
            child: Text(e.toString()),
            value: e,
          );
        }).toList(),
        onChanged: (selected) {
          setState(() {
            selectedCredit = selected!;
            widget.onSelected(selectedCredit);
          });
        },
        value: selectedCredit,
      ),
    );
  }
}
