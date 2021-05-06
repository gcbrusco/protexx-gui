import 'dart:async';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:sensors/sensors.dart';
import 'package:time/time.dart';

Map<DateTime, List<Data>> tests = new Map();

void main() {
  runApp(
    MaterialApp(
      title: "TEST",
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Home(),
        '/complete' : (BuildContext context) => Complete(),
        '/new' : (BuildContext context) => NewTest(),
        '/data' : (BuildContext context) => DataPage(),
        '/retake' : (BuildContext context) => RetakeTest(),
        '/time' : (BuildContext context) => TimePage(),
        '/test': (BuildContext context) => TestPage(),
        '/compare': (BuildContext context) => ComparePage(),
        '/graph': (BuildContext context) => GraphPage(),
      },
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFF)),
      home: Scaffold(
        appBar: AppBar(
            title: Text('Welcome to PROTXX'),
            backgroundColor: Colors.red,
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/");
                  }),
            ]),
        body: Column(
          children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: Text(
                  'Welcome to the PROTXX sensor home page.'
                      ' From here, you can choose to perform a new test '
                      'or view past data.',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                  textAlign: TextAlign.center,
                )),
            RaisedButton.icon(
              label: Text('New Test'),
              icon: Icon(Icons.add_circle_rounded, color: Colors.black),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.red,
              padding: EdgeInsets.all(5),
              onPressed: () {
                Navigator.of(context).pushNamed("/new");
              },
            ),
            RaisedButton.icon(
              label: Text('Past Data'),
              icon: Icon(Icons.bar_chart_rounded, color: Colors.black),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.red,
              padding: EdgeInsets.all(5),
              onPressed: () {
                Navigator.of(context).pushNamed("/data");
              },
            ),
            RaisedButton.icon(
              label: Text('Compare Results'),
              icon: Icon(Icons.info, color: Colors.black),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.red,
              padding: EdgeInsets.all(5),
              onPressed: () {
                Navigator.of(context).pushNamed("/compare");
              },
            ),
          ],
        ),
      ),
    );
  } // Widget
}

class Complete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFF)),
      home: Scaffold(
        body: Column(
          children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: Text(
                  'Your test is complete. Please choose an option '
                      'from the selection below',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                  textAlign: TextAlign.center,
                )),
            RaisedButton.icon(
              label: Text('See Data'),
              icon: Icon(Icons.add_circle_rounded, color: Colors.black),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.red,
              padding: EdgeInsets.all(5),
              onPressed: () {
                Navigator.of(context).pushNamed("/data");
              },
            ),
            RaisedButton.icon(
              label: Text('Retake Test'),
              icon: Icon(Icons.bar_chart_rounded, color: Colors.black),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.red,
              padding: EdgeInsets.all(5),
              onPressed: () {
                Navigator.of(context).pushNamed("/new");
              },
            ),
          ],
        ),
        appBar:
        AppBar(title: Text('Test Complete'),
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

class NewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFF)),
      home: Scaffold(
        body: Column(
          children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: Text(
                  'Follow the directions on the screen.',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                  textAlign: TextAlign.center,
                )),
            RaisedButton.icon(
              label: Text('Take Test'),
              icon: Icon(Icons.bar_chart_rounded, color: Colors.black),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.red,
              padding: EdgeInsets.all(5),
              onPressed: () {
                Navigator.of(context).pushNamed("/time");
              },
            ),
          ],
        ),
        appBar: AppBar(title: Text('PROTXX Test'),
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

class DataPage extends StatelessWidget {
  final List names = tests.keys.toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFF)),
      home: Scaffold(
          appBar: AppBar(
              title: Text("Data"),
              backgroundColor: Colors.red,
              actions: <Widget>[
                IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/");
                    }),
              ]),
          body: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: names.length,
            itemBuilder: (context, index) {
              return new Card (
              child: new ListTile(
                tileColor: Colors.red,
                trailing: Icon(Icons.insert_chart_outlined, color: Colors.white),
                title: FlatButton(
                  child: new Text('${names[index].month}/${names[index].day}/${names[index].year}'
                    ' at ${names[index].hour}:${names[index].minute}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.left,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/graph',
                    arguments: names[index],
                  );
                },
              ),),
              );
              },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.black,
              );
            },
          )),
    );
  }
}


class RetakeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Retake Test"),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context).pushNamed("/");
                }),
          ]),
    );
  }
}

class TimePage extends StatefulWidget {
  Time createState() => Time();
}

class Time extends State<TimePage> {
  int dropdownValue = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFF)),
      home: Scaffold(
        appBar: AppBar(
            title: Text('Protxx App'),
            backgroundColor: Colors.red,
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/");
                  }),
            ]),
        body: Column(children: [
          Container(
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
          Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              "Please select a length of time (seconds)",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          Container(
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
                    dropdownValue = newValue;
                  });
                },
                items: <int>[10, 15, 20, 25, 30].map((int value) {
                  return new DropdownMenuItem<int>(
                    value: value,
                    child: new Text(value.toString()),
                  );
                }).toList(),
              )),
          Container(
            padding: const EdgeInsets.all(100),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                minimumSize: Size(100, 50),
              ),
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/test',
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

class TestPage extends StatefulWidget {
  Test createState() => Test();
}

class Test extends State<TestPage> {
  int selection;
  List<Data> chartData;
  DateTime time = DateTime.now();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selection = ModalRoute.of(context).settings.arguments;
  }


  List<Data> getChartData() {
    //TODO: Make sure the data list has the # of element because right now it only works with 10 sec tests
    //find accelerometer data
    List<Data> chartData = new List(selection);
    UserAccelerometerEvent event;
    Timer timer;
    StreamSubscription accel;

    var list_x = new List(selection);
    var list_y = new List(selection);
    var list_z = new List(selection);
    var list_time = new List(selection);
    var tempSelection = selection;

    print("START");
    int count = 0;
    if (accel == null) {
      accel = userAccelerometerEvents.listen((UserAccelerometerEvent eve) {
        setState(() {
          event = eve;
        });
      });
    } else {
      accel.resume();
    }
    if (timer == null || !timer.isActive) {
      timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
        if (count == tempSelection) {
          timer.cancel();
          accel.pause();
          print("x");
          print(list_x);
          print("y");
          print(list_y);
          print("z");
          print(list_z);
          print("time");
          print(list_time);
        } else {
          list_x[count] = event.x;
          list_y[count] = event.y;
          list_z[count] = event.z;
          list_time[count] = count.toDouble();
          chartData[count] =
              Data(count.toDouble(), event.x, event.y, event.z);
          count++;
          print(count);
          print(selection);
        }
      });
    }
    tests[time] = chartData;
    return chartData;
  }

  Timer _timer;

  void _startTimer() {
    chartData = getChartData();
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (selection > 0) {
          selection--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFF)),
      home: Scaffold(
        appBar: AppBar(
            title: Text('Protxx App'),
            backgroundColor: Colors.red,
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/");
                  }),
            ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              (selection > 0)
                  ? Text("")
                  : Text(
                "DONE!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
              Text(
                '$selection',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
              (selection > 0)
                  ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  minimumSize: Size(30, 30),
                ),
                onPressed: () => _startTimer(),
                child: Text("Begin Test"),
              )
                  : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  minimumSize: Size(30, 30),
                ),
                onPressed: () {
                  //TODO: CHANGE TO PREVIOUS TEST PAGE
                  Navigator.of(context).pushNamed(
                    '/graph',
                    arguments: time,
                  );
                },
                child: Text("See Results"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ComparePage extends StatefulWidget {
  Compare createState() => Compare();
}

class Compare extends State<ComparePage> {
  String gender = 'Male';
  int age = 0;
  String condition = 'Concussion';
  int severity = 0;
  bool eyesOpen = true;

  void changeRadioValue(String value) {
    setState(() {
      gender = value;
    });
  }

  void changeAgeValue(double value) {
    setState(() {
      age = value.round();
    });
  }

  void changeSeverityValue(double value) {
    setState(() {
      severity = value.round();
    });
  }

  void changeVisionCondition(bool value) {
    setState(() {
      eyesOpen = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(
            scaffoldBackgroundColor: const Color(0xFFFF),
            unselectedWidgetColor: Colors.red),
        home: Scaffold(
            appBar: AppBar(
                title: Text('Protxx App'),
                backgroundColor: Colors.red,
                actions: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.home),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/");
                      }),
                ]),
            body: Center(
                child: Column(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      "Choose Mock Test Options:",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Select a gender: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                          value: 'Male',
                          groupValue: gender,
                          activeColor: Colors.red,
                          onChanged: changeRadioValue,
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Radio(
                          value: 'Female',
                          groupValue: gender,
                          activeColor: Colors.red,
                          onChanged: changeRadioValue,
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )
                      ]),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Age: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Slider(
                    activeColor: Colors.red,
                    inactiveColor: Colors.grey,
                    value: age.toDouble(),
                    min: 0,
                    max: 150,
                    divisions: 150,
                    label: age.round().toString(),
                    onChanged: changeAgeValue,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Neurological Condition: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DropdownButton(
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    iconSize: 20,
                    dropdownColor: Colors.red,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    value: condition,
                    onChanged: (String value) {
                      setState(() {
                        condition = value;
                      });
                    },
                    items: <String>[
                      'Concussion',
                      'Condition 2',
                      'Condition 3',
                      'Condition 4',
                      'Condition 5'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Severity: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Slider(
                    activeColor: Colors.red,
                    inactiveColor: Colors.grey,
                    value: severity.toDouble(),
                    min: 0,
                    max: 10,
                    divisions: 10,
                    label: severity.round().toString(),
                    onChanged: changeSeverityValue,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Vision status:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                          value: true,
                          groupValue: eyesOpen,
                          onChanged: changeVisionCondition,
                        ),
                        Text(
                          'Eyes open',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Radio(
                          value: false,
                          groupValue: eyesOpen,
                          onChanged: changeVisionCondition,
                        ),
                        Text(
                          'Eyes closed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ]),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
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
                        );
                      },

                      child: Text("Continue"),
                    ),
                  ),
                ]))));
  }
}

class GraphPage extends StatefulWidget {
  Graph createState() => Graph();
}

class Graph extends State<GraphPage>{
  DateTime selectedChart;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedChart = ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFF)),
        home: Scaffold(
          appBar: AppBar(
              title: Text('Welcome to PROTXX'),
              backgroundColor: Colors.red,
              actions: <Widget>[
                IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/");
                    }),
              ]),

          body: SfCartesianChart(
            title: ChartTitle(text: 'Accelerometer Data'),
            legend: Legend(isVisible: true),
            backgroundColor: Colors.white,
            series: <ChartSeries>[
              LineSeries<Data, double>(
                  name: 'x',
                  dataSource: tests[selectedChart],
                  xValueMapper: (Data data, _) => data.time,
                  yValueMapper: (Data data, _) => data.x,
                  dataLabelSettings: DataLabelSettings(isVisible: true)),
              LineSeries<Data, double>(
                  name: 'y',
                  dataSource: tests[selectedChart],
                  xValueMapper: (Data data, _) => data.time,
                  yValueMapper: (Data data, _) => data.y,
                  dataLabelSettings: DataLabelSettings(isVisible: true)),
              LineSeries<Data, double>(
                  name: 'z',
                  dataSource: tests[selectedChart],
                  xValueMapper: (Data data, _) => data.time,
                  yValueMapper: (Data data, _) => data.z,
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ],
            primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
            primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
          ),
        ));
  }
}

class Data {
  double time;
  double x;
  double y;
  double z;

  Data(this.time, this.x, this.y, this.z);
}
