import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'data.dart';
import 'new_test.dart';
import 'compare.dart';
import 'power.dart';
import 'compare_menu.dart';
import 'data_page.dart';
import 'test.dart';
import 'time.dart';

class GraphPage extends StatefulWidget {
  Graph createState() => Graph();
}

class Graph extends State<GraphPage> {
  //page to display acceleration graphs

  DateTime selectedChart; //data to be stored from passes value

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedChart = ModalRoute.of(context).settings.arguments; //assigned to passed value
  }

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
            appBar: AppBar(
              //red app bar at top of page
                title: Text('Data Display'),
                backgroundColor: Colors.red,
                actions: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.home),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/");
                      }),
                ]),
            body: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      //size of graph
                      width: MediaQuery.of(context).size.width,
                      height:
                      12 * (MediaQuery.of(context).size.height / 2) / 16,
                      child: SfCartesianChart( //graph widget
                        title: ChartTitle(text: 'Eyes Open Accelerometer Data'),
                        legend: Legend(isVisible: true),
                        backgroundColor: Colors.white,
                        series: <ChartSeries>[
                          LineSeries<Data, double>( //assign values to x and y coordinates of graph
                              name: 'x',
                              dataSource: testsOpen[selectedChart],
                              xValueMapper: (Data data, _) => data.time,
                              yValueMapper: (Data data, _) => data.x,
                              dataLabelSettings:
                              DataLabelSettings(isVisible: false)),
                          LineSeries<Data, double>(
                              name: 'y',
                              dataSource: testsOpen[selectedChart],
                              xValueMapper: (Data data, _) => data.time,
                              yValueMapper: (Data data, _) => data.y,
                              dataLabelSettings:
                              DataLabelSettings(isVisible: false)),
                          LineSeries<Data, double>(
                              name: 'z',
                              dataSource: testsOpen[selectedChart],
                              xValueMapper: (Data data, _) => data.time,
                              yValueMapper: (Data data, _) => data.z,
                              dataLabelSettings:
                              DataLabelSettings(isVisible: false))
                        ],
                        primaryXAxis: NumericAxis(
                            title: AxisTitle(
                              text: 'time (s)',
                            ),
                            edgeLabelPlacement: EdgeLabelPlacement.shift),
                        primaryYAxis: NumericAxis(
                            title: AxisTitle(
                              text: 'acceleration (m/s^2)',
                            ),
                            edgeLabelPlacement: EdgeLabelPlacement.shift),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height:
                      12 * (MediaQuery.of(context).size.height / 2) / 16,
                      child: SfCartesianChart(
                        title:
                        ChartTitle(text: 'Eyes Closed Accelerometer Data'),
                        legend: Legend(isVisible: true),
                        backgroundColor: Colors.white,
                        series: <ChartSeries>[
                          LineSeries<Data, double>(
                              name: 'x',
                              dataSource: testsClosed[selectedChart],
                              xValueMapper: (Data data, _) => data.time,
                              yValueMapper: (Data data, _) => data.x,
                              dataLabelSettings:
                              DataLabelSettings(isVisible: false)),
                          LineSeries<Data, double>(
                              name: 'y',
                              dataSource: testsClosed[selectedChart],
                              xValueMapper: (Data data, _) => data.time,
                              yValueMapper: (Data data, _) => data.y,
                              dataLabelSettings:
                              DataLabelSettings(isVisible: false)),
                          LineSeries<Data, double>(
                              name: 'z',
                              dataSource: testsClosed[selectedChart],
                              xValueMapper: (Data data, _) => data.time,
                              yValueMapper: (Data data, _) => data.z,
                              dataLabelSettings:
                              DataLabelSettings(isVisible: false))
                        ],
                        primaryXAxis: NumericAxis(
                            title: AxisTitle(
                              text: 'time (s)',
                            ),
                            edgeLabelPlacement: EdgeLabelPlacement.shift),
                        primaryYAxis: NumericAxis(
                            title: AxisTitle(
                              text: 'acceleration (m/s^2)',
                            ),
                            edgeLabelPlacement: EdgeLabelPlacement.shift),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(top: 10, right: 15),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                minimumSize: Size(30, 30),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/data'); //navigate to past data page
                              },
                              child: Text("Previous Data",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),),
                          Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                minimumSize: Size(30, 30),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/power', //navigate to power graph page
                                  arguments: selectedChart,
                                );
                              },
                              child: Text("Power Graph",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),),
                          Expanded(
                            child: Container(
                            padding: const EdgeInsets.only(top: 10, left: 15),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                minimumSize: Size(30, 30),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed( //navigate to compare menu page
                                  '/compareMenu',
                                  arguments: selectedChart,
                                );
                              },
                              child: Text("Compare Data",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),),
                        ]),
                  ],
                ),
              ],
    )));
  }
}