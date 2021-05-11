import 'package:flutter/material.dart';

import 'compare.dart';
import 'graph.dart';

class DataPage extends StatefulWidget {
  DataP createState() => DataP();
}

class DataP extends State<DataPage> {
  //page to display previous data entries
  final List names = testsOpen.keys.toList(); //list of all dates for previous tests

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/graph': (BuildContext context) => GraphPage()}, //page displaying graphs
      //create black app background
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFF)),
      home: Scaffold(
          appBar: AppBar(
            //red appbar at top of screen with home button and title
              title: Text("Previous Data"),
              backgroundColor: Colors.red,
              actions: <Widget>[
                IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/");
                    }),
              ]),
          body: ListView.separated(
            //list of all previous test values
            padding: const EdgeInsets.all(8), //space tests
            itemCount: names.length, //number of tests
            itemBuilder: (context, index) {
              return new Card(
                child: new ListTile(
                  tileColor: Colors.red,
                  trailing:
                  Icon(Icons.insert_chart_outlined, color: Colors.white),
                  title: FlatButton(
                    child: new Text( //text to display time of test
                      '${names[index].month}/${names[index].day}/${names[index].year}'
                          ' at ${names[index].hour}:${names[index].minute}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/graph', //navigate to page with acceleration graphs
                        arguments: names[index], //pass the data information for that specific datetime
                      );
                    },
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider( //divide between entries
                color: Colors.black,
              );
            },
          )),
    );
  }
}