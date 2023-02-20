import 'package:calculator/data.dart';
import 'package:calculator/defaults.dart';
import 'package:calculator/texts/texts.dart';
import 'package:flutter/material.dart';

import 'lecture.dart';

class LecList extends StatelessWidget {
  final Function onDismissed;
  final TXT allTexts;
  const LecList({required this.allTexts, required this.onDismissed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Lecture> lecList = Data.lecList;
    return lecList.length > 0
        ? ListView.builder(
            itemCount: Data.lecList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                onDismissed: (a) {
                  onDismissed(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text(
                        lecList[index].lecName,
                        style: Defaults.cardMainText,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Defaults.mainColor,
                        child: Text(Data.noteToString(lecList[index].noteVal)),
                      ),
                      subtitle: Text(
                        allTexts.listDescrpCredit +
                            ': ${lecList[index].creditVal} , ' +
                            allTexts.listDescrpNote +
                            ' : ${Data.noteToString(lecList[index].noteVal)}  ',
                        style: Defaults.cardsubText,
                      ),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Container(
              child: Text(
                allTexts.listEmpty,
                style: Defaults.inputText,
              ),
            ),
          );
  }
}
