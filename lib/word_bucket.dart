import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:math';
import 'word_global.dart';

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
    setState(() {
      if (Global.wordList.length > 1) {
        Global.wordList.removeAt(index);
        index = new Random().nextInt(Global.wordList.length);
      }
    });
  }

  void _noKnowWord() {
    setState(() {
      if (Global.wordList.length > 1) {
        index = new Random().nextInt(Global.wordList.length);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (!Global.loadedCSV) {
      loadCSV();
      setState(() {
        Global.loadedCSV = true;
      });
    }
    index = new Random().nextInt(Global.wordList.length);
  }

  void loadCSV() async {
    var myData = await rootBundle.loadString("assets/mycsv.csv");
    List<List<dynamic>> csvTable =
        CsvToListConverter(fieldDelimiter: ",", eol: '\n').convert(myData);
    setState(() {
      Global.wordList.addAll(csvTable);
      Global.wordList.removeAt(0);
      // print(csvTable);
      // print(csvTable[0]);
      // print(csvTable[0][2]);
    });
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
                new IconButton(
                  icon: Icon(Icons.clear, size: 30.0),
                  color: Colors.red,
                  onPressed: _noKnowWord,
                ),
                // SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  height: 100,
                  child: AutoSizeText(
                    Global.wordList[index][0],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8), fontSize: 80),
                    maxLines: 1,
                  ),
                ),
                // SizedBox(width: 40),
                new IconButton(
                  icon: Icon(Icons.done, size: 30.0),
                  color: Colors.green,
                  onPressed: _knowWord,
                ),
                // SizedBox(width: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
