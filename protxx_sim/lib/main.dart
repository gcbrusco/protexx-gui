import 'package:flutter/material.dart';

import 'data.dart';
import 'new_test.dart';
import 'compare.dart';
import 'power.dart';
import 'graph.dart';
import 'compare_menu.dart';
import 'home.dart';
import 'data_page.dart';
import 'test.dart';
import 'time.dart';

void main() {
  //Main function for protxx demo application
  runApp(
    MaterialApp(
      title: "MAIN",
      initialRoute: '/',
      //routes to each page of the app
      routes: {
        '/': (BuildContext context) => Home(), //home page
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
    ),
  );
}