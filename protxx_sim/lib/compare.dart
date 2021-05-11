import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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

//two maps for two separate tests (eyes open, eyes closed) key-> datetime of test, value: data values
Map<DateTime, List<Data>> testsOpen = new Map();
Map<DateTime, List<Data>> testsClosed = new Map();

class ComparePage extends StatefulWidget {
  Compare createState() => Compare();
}

class Compare extends State<ComparePage> {
  //graphical display of user data compared to mock tests data
  Map info = {};

  @override
  Widget build(BuildContext context) {
    info = ModalRoute.of(context).settings.arguments; //store passed data in info
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
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Container( //title of graph
              child: Text(
                'Selected Data',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row( //user graphs
              children: <Widget>[
                Container(
                  //size of graph
                  width: MediaQuery.of(context).size.width / 2,
                  height: 11 * (MediaQuery.of(context).size.height / 2) / 16,
                  child: SfCartesianChart( //graph widget
                    title: ChartTitle(text: 'Eyes Open'),
                    legend: Legend(isVisible: true),
                    backgroundColor: Colors.white,
                    series: <ChartSeries>[
                      LineSeries<Data, double>(
                          name: 'x',
                          dataSource: testsOpen[info['chart']], //data points
                          xValueMapper: (Data data, _) => data.time, //x axis values
                          yValueMapper: (Data data, _) => data.x, //y axis values
                          dataLabelSettings:
                          DataLabelSettings(isVisible: false)), //ignore data labels
                      LineSeries<Data, double>(
                          name: 'y',
                          dataSource: testsOpen[info['chart']],
                          xValueMapper: (Data data, _) => data.time,
                          yValueMapper: (Data data, _) => data.y,
                          dataLabelSettings:
                          DataLabelSettings(isVisible: false)),
                      LineSeries<Data, double>(
                          name: 'z',
                          dataSource: testsOpen[info['chart']],
                          xValueMapper: (Data data, _) => data.time,
                          yValueMapper: (Data data, _) => data.z,
                          dataLabelSettings:
                          DataLabelSettings(isVisible: false))
                    ],
                    primaryXAxis: NumericAxis(
                        edgeLabelPlacement: EdgeLabelPlacement.shift),
                    primaryYAxis: NumericAxis(
                        edgeLabelPlacement: EdgeLabelPlacement.shift),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 11 * (MediaQuery.of(context).size.height / 2) / 16,
                  child: SfCartesianChart(
                    title: ChartTitle(text: 'Eyes Closed'),
                    legend: Legend(isVisible: true),
                    backgroundColor: Colors.white,
                    series: <ChartSeries>[
                      LineSeries<Data, double>(
                          name: 'x',
                          dataSource: testsClosed[info['chart']],
                          xValueMapper: (Data data, _) => data.time,
                          yValueMapper: (Data data, _) => data.x,
                          dataLabelSettings:
                          DataLabelSettings(isVisible: false)),
                      LineSeries<Data, double>(
                          name: 'y',
                          dataSource: testsClosed[info['chart']],
                          xValueMapper: (Data data, _) => data.time,
                          yValueMapper: (Data data, _) => data.y,
                          dataLabelSettings:
                          DataLabelSettings(isVisible: false)),
                      LineSeries<Data, double>(
                          name: 'z',
                          dataSource: testsClosed[info['chart']],
                          xValueMapper: (Data data, _) => data.time,
                          yValueMapper: (Data data, _) => data.z,
                          dataLabelSettings:
                          DataLabelSettings(isVisible: false))
                    ],
                    primaryXAxis: NumericAxis(
                        edgeLabelPlacement: EdgeLabelPlacement.shift),
                    primaryYAxis: NumericAxis(
                        edgeLabelPlacement: EdgeLabelPlacement.shift),
                  ),
                ),
              ],
            ),
            Row(
              //row of text for mock test data labels
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //space across page evenly
              children: <Widget>[
                Text(
                  '    Mock Data',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                Column(children: <Widget>[
                  //list parameters selected from previous page
                  Text(
                    'Gender:  ${info['Gender']}', textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Age: ${info['Age']}', textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Condition: ${info['Condition']}', textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Severity: ${info['Severity']}', textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ]),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 11 * (MediaQuery.of(context).size.height / 2) / 16,
                  child: SfCartesianChart(
                    title: ChartTitle(text: 'Eyes Open'),
                    legend: Legend(isVisible: true),
                    backgroundColor: Colors.white,
                    series: <ChartSeries>[
                      LineSeries<Data, double>(
                          name: 'x',
                          dataSource: testsOpen[info['chart']],
                          xValueMapper: (Data data, _) => data.time,
                          yValueMapper: (Data data, _) => data.x,
                          dataLabelSettings:
                          DataLabelSettings(isVisible: false)),
                      LineSeries<Data, double>(
                          name: 'y',
                          dataSource: testsOpen[info['chart']],
                          xValueMapper: (Data data, _) => data.time,
                          yValueMapper: (Data data, _) => data.y,
                          dataLabelSettings:
                          DataLabelSettings(isVisible: false)),
                      LineSeries<Data, double>(
                          name: 'z',
                          dataSource: testsOpen[info['chart']],
                          xValueMapper: (Data data, _) => data.time,
                          yValueMapper: (Data data, _) => data.z,
                          dataLabelSettings:
                          DataLabelSettings(isVisible: false))
                    ],
                    primaryXAxis: NumericAxis(
                        edgeLabelPlacement: EdgeLabelPlacement.shift),
                    primaryYAxis: NumericAxis(
                        edgeLabelPlacement: EdgeLabelPlacement.shift),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 11 * (MediaQuery.of(context).size.height / 2) / 16,
                  child: SfCartesianChart(
                    title: ChartTitle(text: 'Eyes Closed'),
                    legend: Legend(isVisible: true),
                    backgroundColor: Colors.white,
                    series: <ChartSeries>[
                      LineSeries<Data, double>(
                          name: 'x',
                          dataSource: testsClosed[info['chart']],
                          xValueMapper: (Data data, _) => data.time,
                          yValueMapper: (Data data, _) => data.x,
                          dataLabelSettings:
                          DataLabelSettings(isVisible: false)),
                      LineSeries<Data, double>(
                          name: 'y',
                          dataSource: testsClosed[info['chart']],
                          xValueMapper: (Data data, _) => data.time,
                          yValueMapper: (Data data, _) => data.y,
                          dataLabelSettings:
                          DataLabelSettings(isVisible: false)),
                      LineSeries<Data, double>(
                          name: 'z',
                          dataSource: testsClosed[info['chart']],
                          xValueMapper: (Data data, _) => data.time,
                          yValueMapper: (Data data, _) => data.z,
                          dataLabelSettings:
                          DataLabelSettings(isVisible: false))
                    ],
                    primaryXAxis: NumericAxis(
                        edgeLabelPlacement: EdgeLabelPlacement.shift),
                    primaryYAxis: NumericAxis(
                        edgeLabelPlacement: EdgeLabelPlacement.shift),
                  ),
                ),
              ],
            ),
            Row(
              //row of buttons to navigate across screens
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: Size(30, 30),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/data', //page to select new user data
                        );
                      },
                      child: Text("Select new data"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: Size(30, 30),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/compareMenu', //page to change mock test data
                          arguments: info['chart'],
                        );
                      },
                      child: Text("Select new mock test"),
                    ),
                  ),
                ])
          ],
        ),
        appBar: AppBar(
          //top of page app bar
            title: Text('Compare Data'),
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