import 'package:flutter/material.dart';
import 'package:hello_world/word_viewer.dart';
import 'word_bucket.dart';
import 'word_viewer.dart';
import 'word_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFF15156),
            elevation: 0,
            bottom: TabBar(
              labelColor: Colors.redAccent,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white),
              tabs: [
                new Container(
                  width: double.infinity,
                  child: new Tab(
                    icon: Icon(Icons.flag),
                  ),
                ),
                new Container(
                  width: double.infinity,
                  child: new Tab(icon: Icon(Icons.timer)),
                ),
                new Container(
                  width: double.infinity,
                  child: new Tab(icon: Icon(Icons.settings)),
                ),
              ],
            ),
            title: Text('Peekword'),
          ),
          body: TabBarView(
            children: [
              WordBucket(title: 'Flutter Demo Home Page'),
              WordViewer(title: 'Flutter Demo Home Page'),
              WordConfig(title: 'Flutter Demo Home Page'),
            ],
          ),
        ),
      ),
    );
  }
}
