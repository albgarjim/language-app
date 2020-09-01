import 'package:flutter/material.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'word_global.dart';

class WordViewer extends StatefulWidget {
  WordViewer({Key key, this.title}) : super(key: key);
  final String title;

  @override
  WordViewerState createState() => WordViewerState();
}

class WordViewerState extends State<WordViewer> {
  bool play = true;
  Timer timer;
  IconData iconData = Icons.play_arrow;

  updateTime(Timer timer) {
    setState(() {
      Global.index += 1;
      if (Global.index >= Global.wordList.length) {
        Global.index = 0;
      }
    });
  }

  prevWord() {
    setState(() {
      if (Global.index <= 0) {
        Global.index = Global.wordList.length - 1;
      } else {
        Global.index -= 1;
      }
    });
  }

  nextWord() {
    setState(() {
      if (Global.index >= Global.wordList.length - 1) {
        Global.index = 0;
      } else {
        Global.index += 1;
      }
    });
  }

  startOrStop() {
    print("checking play");
    if (play) {
      startWatch();
    } else {
      stopWatch();
    }
  }

  startWatch() {
    setState(() {
      play = false;
      print("starting");
      iconData = Icons.stop;
      timer = Timer.periodic(Duration(milliseconds: Global.wait), updateTime);
    });
  }

  stopWatch() {
    setState(() {
      play = true;
      print("stopped");
      iconData = Icons.play_arrow;
      if (timer != null) {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: AutoSizeText(
                      Global.wordList[Global.index][Global.mainLanguage],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8), fontSize: 80),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Container(
              color: const Color(0xFFEDDCD2),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.10,
                  ),
                  Container(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: AutoSizeText(
                        Global.wordList[Global.index][Global.secLanguage],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8), fontSize: 50),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: MediaQuery.of(context).size.width * 0.10,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Container(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: AutoSizeText(
                        Global.wordList[Global.index][2],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8), fontSize: 20),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.navigate_before, size: 30.0),
                      color: Colors.grey,
                      onPressed: prevWord,
                    ),
                    IconButton(
                      icon: Icon(Icons.play_arrow, size: 30.0),
                      color: Colors.grey,
                      onPressed: startOrStop,
                    ),
                    IconButton(
                      icon: Icon(Icons.navigate_next, size: 30.0),
                      color: Colors.grey,
                      onPressed: nextWord,
                    ),
                    // SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: startOrStop,
      //   child: Icon(iconData),
      //   backgroundColor: Color(0xFFF15156),
      // ),
    );
  }
}
