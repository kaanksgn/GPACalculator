import 'package:calculator/data.dart';
import 'package:calculator/defaults.dart';
import 'package:calculator/leclist.dart';
import 'package:calculator/lecture.dart';
import 'package:calculator/showresults.dart';
import 'package:calculator/texts/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TXT allTexts = Texts.en;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<int> creditList = List.generate(10, (index) => index + 1).toList();
  Map<String, double> noteList = {
    'AA': 4.0,
    'BA': 3.5,
    'BB': 3.0,
    'CB': 2.5,
    'CC': 2.0,
    'DC': 1.5,
    'DD': 1.0,
    'FD': 0.5,
    'FF': 0
  };
  double selectedNote = 4.0;
  int selectedCredit = 0;
  String addedLect = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCredit = creditList.first;
    selectedNote = noteList.values.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: _buildDrawer(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.linear_scale,
              color: Defaults.mainColor,
            ),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            }),
        elevation: 0,
        centerTitle: true,
        bottomOpacity: 0.0,
        title: Text(allTexts.mainTitle, style: Defaults.mainText),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: _buildTextInput(),
                        ),
                        Row(
                          children: [
                            //Note Selection Part
                            _buildNoteSelection(),

                            _buildCreditSelection(),
                            Spacer(),
                            _buildCalculateButton(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _buildResultsSection(),
                ),
              ],
            ),
          ),
          Expanded(
            child: LecList(
              allTexts: allTexts,
              onDismissed: (index) {
                setState(() {
                  Data.lecList.removeAt(index);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalculateButton() {
    return Container(
      decoration: BoxDecoration(
          color: Defaults.mainColor.withOpacity(0.3),
          borderRadius: Defaults.mainBorder),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: IconButton(
        onPressed: _addandCalculate,
        icon: Icon(
          Icons.arrow_forward_ios_sharp,
          color: Defaults.mainColor,
        ),
      ),
    );
  }

  Widget _buildResultsSection() {
    return ShowResults(
        allTexts: allTexts,
        avr: Data.calculate(),
        lectCount: Data.lecList.length);
  }

  Container PlaceHolderResults() {
    return Container(
      height: 200,
      width: 250,
      child: Placeholder(
        color: Colors.purple,
      ),
    );
  }

  Widget _buildCreditSelection() {
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
          });
        },
        value: selectedCredit,
      ),
    );
  }

  //
  //
  Widget _buildNoteSelection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          color: Defaults.mainColor.withOpacity(0.3),
          borderRadius: Defaults.mainBorder),
      child: DropdownButton<double>(
        underline: Container(),
        items: noteList
            .map((key, value) => MapEntry<String, DropdownMenuItem<double>>(
                key, DropdownMenuItem<double>(child: Text(key), value: value)))
            .values
            .toList(),
        onChanged: (selected) {
          setState(() {
            selectedNote = selected!;
            debugPrint(selected.toString());
          });
        },
        value: selectedNote,
      ),
    );
  }

/* List<DropdownMenuItem<double>>? createNoteListButton() {
    // ignore: non_constant_identifier_names
    List<DropdownMenuItem<double>> ReturnList = [];
    noteList.forEach((key, value) {
      ReturnList.add(DropdownMenuItem(
        child: Text(key),
        value: value,
      ));
    });
    return ReturnList;
  }
}
*/
  Widget _buildTextInput() {
    return TextFormField(
      style: Defaults.inputText,
      onSaved: (val) {
        setState(() {
          addedLect = val!;
        });
      },
      validator: (val) {
        if (val!.length <= 0)
          return 'Type a Lecture name';
        else
          return null;
      },
      cursorHeight: 25,
      cursorColor: Defaults.mainColor,
      decoration: InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: Defaults.mainBorder,
          borderSide: BorderSide(color: Colors.red),
        ),
        filled: true,
        fillColor: Defaults.mainColor.withOpacity(0.2),
        hintText: allTexts.textBoxHint,
        errorBorder: OutlineInputBorder(
          borderRadius: Defaults.mainBorder,
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: Defaults.mainBorder,
          borderSide: BorderSide(color: Defaults.mainColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: Defaults.mainBorder,
          borderSide: BorderSide(color: Defaults.mainColor),
        ),
      ),
    );
  }

  void _addandCalculate() {
    bool validate = formKey.currentState!.validate();
    if (validate) {
      formKey.currentState!.save();
      var tempLec = Lecture(
        lecName: addedLect,
        noteVal: selectedNote,
        creditVal: selectedCredit,
      );
      formKey.currentState!.reset();
      Data.addLec(tempLec);
      setState(() {});
    }
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(allTexts.drawerUser),
            accountEmail: Text(allTexts.drawerEmail),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person_outline_sharp,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /* Switch(
                  activeThumbImage: new AssetImage('gpa.png'),
                  activeColor: Colors.transparent,
                  value: Texts.language_type,
                  onChanged: (val) {
                    setState(() {
                      Texts.language_type = val;
                    });
                  }),*/

              Padding(
                padding: const EdgeInsets.all(13.0),
                child: FlutterSwitch(
                    width: 70,
                    height: 40,
                    valueFontSize: 17,
                    showOnOff: true,
                    borderRadius: 17,
                    activeColor: Colors.red.shade900.withOpacity(0.3),
                    inactiveColor: Colors.blue.shade900.withOpacity(0.3),
                    activeIcon: Image.asset(
                      'icon/turkey.png',
                      fit: BoxFit.none,
                    ),
                    inactiveIcon: Image.asset(
                      'icon/united-states.png',
                      fit: BoxFit.cover,
                    ),
                    activeText: 'TR',
                    inactiveText: 'ENG',
                    value: Texts.language_type,
                    onToggle: (val) {
                      setState(() {
                        Texts.language_type = val;
                        Texts.language_type
                            ? allTexts = Texts.tr
                            : allTexts = Texts.en;
                      });
                    }),
              ),
            ],
          ),
          Text(
            '-Developer Text-',
            textAlign: TextAlign.left,
            style:
                TextStyle(fontFamily: 'AkthType', fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
