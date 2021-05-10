import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'new_test.dart';
import 'data.dart';
import 'power.dart';
import 'graph.dart';
import 'compare_menu.dart';
import 'data_page.dart';
import 'test.dart';
import 'time.dart';

Map<DateTime, List<Data>> testsOpen = new Map();
Map<DateTime, List<Data>> testsClosed = new Map();

class ComparePage extends StatefulWidget {
  Compare createState() => Compare();
}

class Compare extends State<ComparePage> {
  Map info = {};

  @override
  Widget build(BuildContext context) {
    info = ModalRoute.of(context).settings.arguments;
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
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              child: Text(
                'Selected Data',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    'Gender:  ${info['Gender']}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Age: ${info['Age']}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Condition: ${info['Condition']}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Severity: ${info['Severity']}',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        minimumSize: Size(30, 30),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/data',
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
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        minimumSize: Size(30, 30),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/compare',
                          arguments: [info['chart']],
                        );
                      },
                      child: Text("Select new mock test"),
                    ),
                  ),
                ])
          ],
        ),
        appBar: AppBar(
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