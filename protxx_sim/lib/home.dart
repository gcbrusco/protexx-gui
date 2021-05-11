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
  //Home page

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //routes to each individual page
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
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFF)),  //set background as black
      home: Scaffold(
        //red appbar at top of screen
        appBar: AppBar(
            title: Text('Welcome'),
            backgroundColor: Colors.red, //color of appbar
            actions: <Widget>[
              IconButton( //home button
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/");
                  }),
            ]),
        //page body contents
        body: Column(
          children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: Text( //home screen main text
                  'Welcome to the PROTXX sensor home page.'
                      ' From here, you can choose to perform a new test '
                      'or view past data.',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                  textAlign: TextAlign.center,
                )),
            //button to navigate to new test screen
            RaisedButton.icon( //new test button
              label: Text('New Test'),
              icon: Icon(Icons.add_circle_rounded, color: Colors.black),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.red,
              padding: EdgeInsets.all(5),
              onPressed: () {
                Navigator.of(context).pushNamed("/new"); //navigate to new test page
              },
            ),
            RaisedButton.icon( //past data button
              label: Text('Past Data'),
              icon: Icon(Icons.bar_chart_rounded, color: Colors.black),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.red,
              padding: EdgeInsets.all(5),
              onPressed: () {
                Navigator.of(context).pushNamed("/data"); //navigate to past data page
              },
            ),
          ],
        ),
      ),
    );
  } // Widget
}