import 'package:flutter/material.dart';

import 'compare.dart';
import 'power.dart';
import 'graph.dart';
import 'compare_menu.dart';
import 'data_page.dart';
import 'test.dart';
import 'time.dart';

class NewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/new': (BuildContext context) => NewTest(), //new test page
        '/data': (BuildContext context) => DataPage(), //past data page
        '/time': (BuildContext context) => TimePage(), //page to select time
        '/test1': (BuildContext context) => TestPage1(), //first testing screen
        '/test2': (BuildContext context) => TestPage2(), //second testing screen
        '/compareMenu': (BuildContext context) => CompareMenuPage(), //select metrics to compare to
        '/graph': (BuildContext context) => GraphPage(), //page displaying graphs
        '/compare': (BuildContext context) => ComparePage(), //page comparing graphs
        '/power': (BuildContext context) => PowerPage(), //page displaying power graphs
      },
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFF)), //set background to black
      home: Scaffold(
        body: Column(
          children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: Text( //new test page directions
                  'Follow the directions on the screen. For the first test, '
                      'please keep your eyes open. For the second test, keep your '
                      'eyes closed.',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                  textAlign: TextAlign.center,
                )),
            RaisedButton.icon( //button to take test
              label: Text('Take Test'),
              icon: Icon(Icons.bar_chart_rounded, color: Colors.black),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.red,
              padding: EdgeInsets.all(5),
              onPressed: () {
                Navigator.of(context).pushNamed("/time"); //got to timing page for first test
              },
            ),
          ],
        ),
        appBar: AppBar(
          //red app bar at top of page
            title: Text('New Test'),
            backgroundColor: Colors.red,
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/home");
                  }),
            ]),
      ),
    );
  } // Widget
}