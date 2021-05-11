import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'data.dart';
import 'new_test.dart';
import 'compare.dart';
import 'graph.dart';
import 'compare_menu.dart';
import 'data_page.dart';
import 'test.dart';
import 'time.dart';

class PowerPage extends StatefulWidget {
  Power createState() => Power();
}

class Power extends State<PowerPage> {
  //page to display power graphs

  DateTime selectedChart; //variable to hold data values

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedChart = ModalRoute.of(context).settings.arguments; //assign selectedChart to passed values
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
        theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFF)),
        home: Scaffold(
            appBar: AppBar( //red aoo bar at top of page
                title: Text('Power Display'),
                backgroundColor: Colors.red,
                actions: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.home),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/"); //home page navigation
                      }),
                ]),
            body: ListView( //display power graphs
              children: <Widget>[
                Column( //column of graphs
                  children: <Widget>[
                    Container(
                      //size of graph
                      width: MediaQuery.of(context).size.width,
                      height:
                      12 * (MediaQuery.of(context).size.height / 2) / 16,
                      child: SfCartesianChart( //graph widget
                        title: ChartTitle(text: 'Eyes Open Power Data'),
                        legend: Legend(isVisible: true),
                        backgroundColor: Colors.white,
                        series: <ChartSeries>[
                          LineSeries<Data, double>( //assign values from selectedChart to graph x and y coordinates
                              name: 'power',
                              dataSource: testsOpen[selectedChart],
                              xValueMapper: (Data data, _) => data.time,
                              yValueMapper: (Data data, _) => data.power,
                              dataLabelSettings:
                              DataLabelSettings(isVisible: false)),
                        ],
                        primaryXAxis: NumericAxis(
                            title: AxisTitle(
                              text: 'time (s)',
                            ),
                            edgeLabelPlacement: EdgeLabelPlacement.shift),
                        primaryYAxis: NumericAxis(
                            title: AxisTitle(
                              text: 'power (J/s)',
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
                        ChartTitle(text: 'Eyes Closed Power Data'),
                        legend: Legend(isVisible: true),
                        backgroundColor: Colors.white,
                        series: <ChartSeries>[
                          LineSeries<Data, double>(
                              name: 'power',
                              dataSource: testsClosed[selectedChart],
                              xValueMapper: (Data data, _) => data.time,
                              yValueMapper: (Data data, _) => data.power,
                              dataLabelSettings:
                              DataLabelSettings(isVisible: false)),
                        ],
                        primaryXAxis: NumericAxis(
                            title: AxisTitle(
                              text: 'time (s)',
                            ),
                            edgeLabelPlacement: EdgeLabelPlacement.shift),
                        primaryYAxis: NumericAxis(
                            title: AxisTitle(
                              text: 'power (J/s)',
                            ),
                            edgeLabelPlacement: EdgeLabelPlacement.shift),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(top: 10, right: 15),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                minimumSize: Size(30, 30),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/data');
                              },
                              child: Text("Previous Data"),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10, left: 15),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                minimumSize: Size(30, 30),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed( //navigate to menu to compare mock tests
                                  '/compareMenu',
                                  arguments: selectedChart,
                                );
                              },
                              child: Text("Compare Data"),
                            ),
                          ),
                        ]),
                  ],
                ),
              ],
            )));
  }
}