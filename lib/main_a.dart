import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage>
    with TickerProviderStateMixin {
  List<String> welcomeImages = [
    "assets/index.jpeg",
    "assets/index.jpeg",
    "assets/index.jpeg",
  ];

  List<String> wordsGerman = [
    "die",
    "hunde",
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return new Scaffold(
      body: new Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: new TinderSwapCard(
                orientation: AmassOrientation.BOTTOM,
                totalNum: wordsGerman.length,
                stackNum: 3,
                swipeEdge: 4.0,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                maxHeight: MediaQuery.of(context).size.width * 0.9,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: MediaQuery.of(context).size.width * 0.8,
                cardBuilder: (context, index) {
                  print('index ${index}');
                  return Card(
                    // child: Image.asset('${welcomeImages[index]}'),
                    child: Text(wordsGerman[index]),
                  );
                },
                cardController: controller = CardController(),
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  /// Get swiping card's alignment
                  if (align.x < 0) {
                    //print("Card is LEFT swiping");
                  } else if (align.x > 0) {
                    //print("Card is RIGHT swiping");
                  }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  print(orientation.toString());
                  if (orientation == CardSwipeOrientation.LEFT) {
                    print("Card is LEFT swiping");
                    print(wordsGerman.length);
                  } else if (orientation == CardSwipeOrientation.RIGHT) {
                    print("Card is RIGHT swiping");
                    print(wordsGerman.length);
                    wordsGerman.add("guten boyen");
                  }
                },
              ),
            ),
            Container(
              child: Text("Flutter CheatSheet."),
            ),
          ],
        ),
      ),
    );
  }
}
