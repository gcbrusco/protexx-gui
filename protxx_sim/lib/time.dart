import 'package:flutter/material.dart';

import 'new_test.dart';
import 'compare.dart';
import 'power.dart';
import 'graph.dart';
import 'compare_menu.dart';
import 'data_page.dart';
import 'test.dart';

class TimePage extends StatefulWidget {
  Time createState() => Time();
}

class Time extends State<TimePage> {
  //page to select time for length of test

  int dropdownValue = 20; //default dropdown menu value

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
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFF)), //set background color to black
      home: Scaffold(
        appBar: AppBar( //red appbar at top of screen
            title: Text('Time Selection'),
            backgroundColor: Colors.red,
            actions: <Widget>[
              IconButton( //home button
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/");
                  }),
            ]),
        body: Column(children: [
          Container( //text to try test
            padding: const EdgeInsets.all(8),
            alignment: Alignment.topCenter,
            child: Text(
              "Try It Yourself!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container( //text to select length of time
            padding: const EdgeInsets.all(5),
            child: Text(
              "Please select a length of time (seconds)",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          Container( //dropdown button to select length of time
              padding: const EdgeInsets.all(50),
              child: DropdownButton(
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
                iconSize: 34,
                dropdownColor: Colors.red,
                style: const TextStyle(color: Colors.white, fontSize: 30),
                value: dropdownValue,
                onChanged: (int newValue) {
                  setState(() {
                    dropdownValue = newValue; //change value displayed in dropdown
                  });
                },
                items: <int>[10, 15, 20, 25, 30].map((int value) { //selectable time values
                  return new DropdownMenuItem<int>(
                    value: value,
                    child: new Text(value.toString()),
                  );
                }).toList(),
              )),
          Container( //button to navigate to next testing screen
            padding: const EdgeInsets.all(100),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                minimumSize: Size(100, 50),
              ),
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/test1',
                  arguments: dropdownValue,
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}