import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'word_global.dart';

class WordViewer extends StatefulWidget {
  WordViewer({Key key, this.title}) : super(key: key);
  final String title;

  @override
  WordViewerState createState() => WordViewerState();
}

class WordViewerState extends State<WordViewer> {
  bool play = true;
  bool menuSection = false;
  bool swapLanguage = false;
  int mainLanguage = 0;
  int secLanguage = 1;
  Timer timer;
  IconData iconData = Icons.play_arrow;
  int index = 0;
  int wait = 1000;

  updateTime(Timer timer) {
    setState(() {
      index = new Random().nextInt(Global.wordList.length);
      print("playing :D $index");
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
      menuSection = false;
      print("starting");
      iconData = Icons.stop;
      timer = Timer.periodic(Duration(milliseconds: wait), updateTime);
    });
  }

  stopWatch() {
    setState(() {
      play = true;
      print("stopped");
      menuSection = true;
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

  _openPopup(context) {
    Alert(
      context: context,
      title: "Configuration",
      content: Column(
        children: <Widget>[
          DialogButton(
            onPressed: () => {
              setState(() {
                if (mainLanguage == 0) {
                  mainLanguage = 1;
                  secLanguage = 0;
                } else {
                  mainLanguage = 0;
                  secLanguage = 1;
                }
              })
            },
            child: Text(
              "Swap languages",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Text(
            "Speed",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () => {
            Navigator.pop(context),
            setState(() {
              stopWatch();
              wait = 1000;
              startWatch();
            })
          },
          child: Text(
            "1",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          onPressed: () => {
            Navigator.pop(context),
            setState(() {
              stopWatch();
              wait = 2000;
              startWatch();
            })
          },
          child: Text(
            "2",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          onPressed: () => {
            Navigator.pop(context),
            setState(() {
              stopWatch();
              wait = 3000;
              startWatch();
            })
          },
          child: Text(
            "3",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          onPressed: () => {
            Navigator.pop(context),
            setState(() {
              stopWatch();
              wait = 4000;
              startWatch();
            })
          },
          child: Text(
            "4",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  Global.wordList[index][mainLanguage],
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8), fontSize: 80),
                ),
              ],
            ),
            SizedBox(height: 60),
            Text(
              Global.wordList[index][secLanguage],
              style:
                  TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 40),
            ),
            SizedBox(height: 60),
            Text(
              Global.wordList[index][2],
              style:
                  TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 25),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  icon: Icon(Icons.settings, size: 30.0),
                  color: Colors.blue,
                  onPressed: () {
                    _openPopup(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: startOrStop,
        child: Icon(iconData),
        backgroundColor: Colors.green,
      ),
    );
  }
}
