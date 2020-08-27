import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:math';
import 'word_global.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class WordBucket extends StatefulWidget {
  WordBucket({Key key, this.title}) : super(key: key);
  final String title;

  @override
  WordBucketState createState() => WordBucketState();
}

class WordBucketState extends State<WordBucket> {
  int index = 0;
  bool initialized = false;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/know.csv');
  }

  void _knowWord() {
    if (Global.wordList.length > 1) {
      Global.wordList.removeAt(index);
      setState(() {
        Global.index = new Random().nextInt(Global.wordList.length);
      });
    }
  }

  void _noKnowWord() {
    if (Global.wordList.length > 1) {
      setState(() {
        Global.index = new Random().nextInt(Global.wordList.length);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (!Global.loadedCSV) {
      loadCSV();
      Global.loadedCSV = true;
    }
    Global.index = new Random().nextInt(Global.wordList.length);
  }

  void loadCSV() async {
    var myData = await rootBundle.loadString("assets/mycsv.csv");
    List<List<dynamic>> csvTable =
        CsvToListConverter(fieldDelimiter: ";", eol: '\n').convert(myData);
    setState(() {
      Global.wordList.addAll(csvTable);
      Global.wordList.removeAt(0);
      // print(csvTable);
      // print(csvTable[0]);
      // print(csvTable[0][2]);
    });
  }

  String dropdownValue = 'German words 0 - 100';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: AutoSizeText(
                "Do you know the word...",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.grey.withOpacity(1), fontSize: 30),
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              color: const Color(0xFFEDDCD2),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: AutoSizeText(
                      Global.wordList[Global.index][0],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8), fontSize: 80),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DialogButton(
                  width: MediaQuery.of(context).size.width * 0.35,
                  color: Color(0xFFF15156),
                  onPressed: _noKnowWord,
                  child: Icon(Icons.clear, color: Colors.white, size: 30.0),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                DialogButton(
                  width: MediaQuery.of(context).size.width * 0.35,
                  color: Color(0xFFF15156),
                  onPressed: _knowWord,
                  child: Icon(Icons.done, color: Colors.white, size: 30.0),
                ),
                // SizedBox(width: 5),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: <Widget>[
            //     SizedBox(
            //       width: MediaQuery.of(context).size.width * 0.15,
            //     ),
            //     new IconButton(
            //       icon: Icon(Icons.done, size: 30.0),
            //       color: Colors.green,
            //       onPressed: _knowWord,
            //     ),
            //     // SizedBox(width: 5),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
