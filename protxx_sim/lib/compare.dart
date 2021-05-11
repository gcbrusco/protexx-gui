import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'data.dart';

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
                        minimumSize: Size(30, 30),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/compareMenu',
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