import 'package:flutter/material.dart';
import 'dart:async';
import 'word_viewer.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "comming soon monkaW",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8), fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
