import 'package:flutter/material.dart';

import 'new_test.dart';
import 'compare.dart';
import 'power.dart';
import 'graph.dart';
import 'compare_menu.dart';
import 'data_page.dart';
import 'test.dart';
import 'time.dart';


class Home extends StatelessWidget {
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
        appBar: AppBar(
            title: Text('Welcome'),
            backgroundColor: Colors.red,
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/");
                  }),
            ]),
        body: Column(
          children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: Text(
                  'Welcome to the PROTXX sensor home page.'
                      ' From here, you can choose to perform a new test '
                      'or view past data.',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                  textAlign: TextAlign.center,
                )),
            RaisedButton.icon(
              label: Text('New Test'),
              icon: Icon(Icons.add_circle_rounded, color: Colors.black),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.red,
              padding: EdgeInsets.all(5),
              onPressed: () {
                Navigator.of(context).pushNamed("/new");
              },
            ),
            RaisedButton.icon(
              label: Text('Past Data'),
              icon: Icon(Icons.bar_chart_rounded, color: Colors.black),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.red,
              padding: EdgeInsets.all(5),
              onPressed: () {
                Navigator.of(context).pushNamed("/data");
              },
            ),
          ],
        ),
      ),
    );
  } // Widget
}