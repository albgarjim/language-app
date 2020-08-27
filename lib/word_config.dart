import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'word_global.dart';

class WordConfig extends StatefulWidget {
  WordConfig({Key key, this.title}) : super(key: key);
  final String title;

  @override
  WordConfigState createState() => WordConfigState();
}

class WordConfigState extends State<WordConfig> {
  bool play = true;
  Timer timer;
  IconData iconData = Icons.play_arrow;
  int index = 0;

  List<List<dynamic>> wordList = [
    ["wor", "translation", "sentence"]
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              "Swap languages",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            DialogButton(
              color: Color(0xFFF15156),
              width: MediaQuery.of(context).size.width * 0.925,
              onPressed: () => {
                if (Global.mainLanguage == 0)
                  {
                    Global.mainLanguage = 1,
                    Global.secLanguage = 0,
                  }
                else
                  {
                    Global.mainLanguage = 0,
                    Global.secLanguage = 1,
                  }
              },
              child: Text(
                "Swap",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              "Seconds per word",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DialogButton(
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: Color(0xFFF15156),
                  onPressed: () => {Global.wait = 2000},
                  child: Text(
                    "2",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                DialogButton(
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: Color(0xFFF15156),
                  onPressed: () => {Global.wait = 3000},
                  child: Text(
                    "3",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                DialogButton(
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: Color(0xFFF15156),
                  onPressed: () => {Global.wait = 4000},
                  child: Text(
                    "4",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                DialogButton(
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: Color(0xFFF15156),
                  onPressed: () => {Global.wait = 6000},
                  child: Text(
                    "6",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
