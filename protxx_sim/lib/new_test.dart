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
        '/new': (BuildContext context) => NewTest(),
        '/data': (BuildContext context) => DataPage(),
        '/time': (BuildContext context) => TimePage(),
        '/test1': (BuildContext context) => TestPage1(),
        '/test2': (BuildContext context) => TestPage2(),
        '/compareMenu': (BuildContext context) => CompareMenuPage(),
        '/graph': (BuildContext context) => GraphPage(),
        '/compare': (BuildContext context) => ComparePage(),
        '/power': (BuildContext context) => PowerPage(),
      },
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFF)),
      home: Scaffold(
        body: Column(
          children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: Text(
                  'Follow the directions on the screen. For the first test, '
                      'please keep your eyes open. For the second test, keep your '
                      'eyes closed.',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                  textAlign: TextAlign.center,
                )),
            RaisedButton.icon(
              label: Text('Take Test'),
              icon: Icon(Icons.bar_chart_rounded, color: Colors.black),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.red,
              padding: EdgeInsets.all(5),
              onPressed: () {
                Navigator.of(context).pushNamed("/time");
              },
            ),
          ],
        ),
        appBar: AppBar(
            title: Text('New Test'),
            backgroundColor: Colors.red,
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/");
                  }),
            ]),
      ),
    );
  } // Widget
}