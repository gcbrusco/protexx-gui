import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'new_test.dart';
import 'data.dart';
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
  DateTime selectedChart;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedChart = ModalRoute.of(context).settings.arguments;
  }

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
                title: Text('Power Display'),
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
                      width: MediaQuery.of(context).size.width,
                      height:
                      12 * (MediaQuery.of(context).size.height / 2) / 16,
                      child: SfCartesianChart(
                        title: ChartTitle(text: 'Power Graph'),
                        legend: Legend(isVisible: true),
                        backgroundColor: Colors.white,
                        series: <ChartSeries>[
                          LineSeries<Data, double>(
                              name: 'power',
                              dataSource: testsOpen[selectedChart],
                              xValueMapper: (Data data, _) => data.time,
                              yValueMapper: (Data data, _) => data.power,
                              dataLabelSettings:
                              DataLabelSettings(isVisible: false)),
                        ],
                        primaryXAxis: NumericAxis(
                            edgeLabelPlacement: EdgeLabelPlacement.shift),
                        primaryYAxis: NumericAxis(
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
                                shape: const BeveledRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
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
                                shape: const BeveledRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                                minimumSize: Size(30, 30),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed(
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