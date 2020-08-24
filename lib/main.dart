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
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
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
