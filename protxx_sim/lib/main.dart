import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:sensors/sensors.dart';
import 'package:time/time.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:vibration/vibration.dart';

Map<DateTime, List<Data>> testsOpen = new Map();
Map<DateTime, List<Data>> testsClosed = new Map();

void main() {
  runApp(
    MaterialApp(
      title: "TEST",
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Home(),
        '/new': (BuildContext context) => NewTest(),
        '/data': (BuildContext context) => DataPage(),
        '/retake': (BuildContext context) => RetakeTest(),
        '/time': (BuildContext context) => TimePage(),
        '/test1': (BuildContext context) => TestPage1(),
        '/test2': (BuildContext context) => TestPage2(),
        '/compareMenu': (BuildContext context) => CompareMenuPage(),
        '/graph': (BuildContext context) => GraphPage(),
        '/compare': (BuildContext context) => ComparePage(),
        '/power': (BuildContext context) => PowerPage(),
      },
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/new': (BuildContext context) => NewTest(),
        '/data': (BuildContext context) => DataPage(),
        '/retake': (BuildContext context) => RetakeTest(),
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
            title: Text('Welcome'),
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
          ],
        ),
      ),
    );
  } // Widget
}

class NewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/new': (BuildContext context) => NewTest(),
        '/data': (BuildContext context) => DataPage(),
        '/retake': (BuildContext context) => RetakeTest(),
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
        body: Column(
          children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: Text(
                  'Follow the directions on the screen. For the first test, '
                  'please keep your eyes open. For the second test, keep your '
                  'eyes closed.',
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
        appBar: AppBar(
            title: Text('New Test'),
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

class DataPage extends StatefulWidget {
  DataP createState() => DataP();
}

class DataP extends State<DataPage> {
  final List names = testsOpen.keys.toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/new': (BuildContext context) => NewTest(),
        '/data': (BuildContext context) => DataPage(),
        '/retake': (BuildContext context) => RetakeTest(),
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
            padding: const EdgeInsets.all(8),
            itemCount: names.length,
            itemBuilder: (context, index) {
              return new Card(
                child: new ListTile(
                  tileColor: Colors.red,
                  trailing:
                      Icon(Icons.insert_chart_outlined, color: Colors.white),
                  title: FlatButton(
                    child: new Text(
                      '${names[index].month}/${names[index].day}/${names[index].year}'
                      ' at ${names[index].hour}:${names[index].minute}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        "/graph",
                        arguments: names[index],
                      );
                    },
                  ),
                ),
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
      appBar: AppBar(title: Text("Retake Test"), actions: <Widget>[
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
      routes: {
        '/new': (BuildContext context) => NewTest(),
        '/data': (BuildContext context) => DataPage(),
        '/retake': (BuildContext context) => RetakeTest(),
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
            title: Text('Time Selection'),
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

class TestPage1 extends StatefulWidget {
  Test1 createState() => Test1();
}

class Test1 extends State<TestPage1> {
  int selection;
  int length;
  DateTime time = DateTime.now();
  List<Data> chartDataOpen;
  List<Data> chartDataClosed;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selection = ModalRoute.of(context).settings.arguments;
    length = ModalRoute.of(context).settings.arguments;
  }

  List<Data> getChartData() {
    //TODO: Make sure the data list has the # of element because right now it only works with 10 sec tests
    //find accelerometer data
    int numData = (10 * selection) + 1;
    List<Data> chartData = new List(numData);
    UserAccelerometerEvent event;
    Timer timer;
    StreamSubscription accel;

    double vx;
    double vy;
    double vz;
    double powerX;
    double powerY;
    double powerZ;

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
      timer = Timer.periodic(Duration(milliseconds: 100), (_) {
        if (count == numData) {
          timer.cancel();
          accel.pause();
        } else {
          chartData[count] =
              Data(count.toDouble(), event.x, event.y, event.z, 0);

          if (count == 0) {
            vx = 0;
            vy = 0;
            vz = 0;
          } else {
            vx = (chartData[count].x - chartData[count - 1].x) * .1;
            vy = (chartData[count].y - chartData[count - 1].y) * .1;
            vz = (chartData[count].z - chartData[count - 1].z) * .1;
          }
          powerX = vx * chartData[count].x;
          powerY = vy * chartData[count].y;
          powerZ = vz * chartData[count].z;
          chartData[count].power = (powerX + powerY + powerZ) / 3;

          count++;
        }
      });
    }
    return chartData;
  }

  Timer _timer;

  void _startTimer() {
    chartDataOpen = getChartData();
    testsOpen[time] = chartDataOpen;

    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (selection > 0) {
          selection--;
        } else {
          FlutterRingtonePlayer.playNotification();
          Vibration.vibrate();
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/new': (BuildContext context) => NewTest(),
        '/data': (BuildContext context) => DataPage(),
        '/retake': (BuildContext context) => RetakeTest(),
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
            title: Text('Eyes Open Test'),
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
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  "Keep your eyes open for this test.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
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
                      child: Text("Begin Test 1"),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        minimumSize: Size(30, 30),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/test2',
                          arguments: {'Time': time, 'Selection': length},
                        );
                      },
                      child: Text("Take Second Test"),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class TestPage2 extends StatefulWidget {
  @override
  Test2 createState() => Test2();
}

class Test2 extends State<TestPage2> {
  List<Data> chartDataClosed;

  Map info = {};

  @override
  List<Data> getChartData() {
    //TODO: Make sure the data list has the # of element because right now it only works with 10 sec tests
    //find accelerometer data
    int numData = (10 * info['Selection']) + 1;
    List<Data> chartData = new List(numData);
    UserAccelerometerEvent event;
    Timer timer;
    StreamSubscription accel;

    double vx;
    double vy;
    double vz;
    double powerX;
    double powerY;
    double powerZ;

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
      timer = Timer.periodic(Duration(milliseconds: 100), (_) {
        if (count == numData) {
          timer.cancel();
          accel.pause();
        } else {
          chartData[count] =
              Data(count.toDouble(), event.x, event.y, event.z, 0);

          if (count == 0) {
            vx = 0;
            vy = 0;
            vz = 0;
          } else {
            vx = (chartData[count].x - chartData[count - 1].x) * .1;
            vy = (chartData[count].y - chartData[count - 1].y) * .1;
            vz = (chartData[count].z - chartData[count - 1].z) * .1;
          }
          powerX = vx * chartData[count].x;
          powerY = vy * chartData[count].y;
          powerZ = vz * chartData[count].z;
          chartData[count].power = (powerX + powerY + powerZ) / 3;

          count++;
        }
      });
    }
    return chartData;
  }

  Timer _timer;

  void _startTimer() {
    chartDataClosed = getChartData();
    testsClosed[info['Time']] = chartDataClosed;

    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (info['Selection'] > 0) {
          info['Selection']--;
        } else {
          FlutterRingtonePlayer.playNotification();
          Vibration.vibrate();
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    info = ModalRoute.of(context).settings.arguments;

    int choice = info['Selection'];

    return MaterialApp(
      routes: {
        '/new': (BuildContext context) => NewTest(),
        '/data': (BuildContext context) => DataPage(),
        '/retake': (BuildContext context) => RetakeTest(),
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
            title: Text('Eyes Closed Test'),
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
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  "Keep your eyes closed for this test.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
              (info['Selection'] > 0)
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
                '$choice',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
              (info['Selection'] > 0)
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        minimumSize: Size(30, 30),
                      ),
                      onPressed: () => _startTimer(),
                      child: Text("Begin Test 2"),
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
                          arguments: info['Time'],
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

class CompareMenuPage extends StatefulWidget {
  CompareMenu createState() => CompareMenu();
}

class CompareMenu extends State<CompareMenuPage> {
  String gender = 'Male';
  int age = 0;
  String condition = 'Concussion';
  int severity = 0;

  DateTime selectedChart;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedChart = ModalRoute.of(context).settings.arguments;
  }

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/new': (BuildContext context) => NewTest(),
          '/data': (BuildContext context) => DataPage(),
          '/retake': (BuildContext context) => RetakeTest(),
          '/time': (BuildContext context) => TimePage(),
          '/test1': (BuildContext context) => TestPage1(),
          '/test2': (BuildContext context) => TestPage2(),
          '/compareMenu': (BuildContext context) => CompareMenuPage(),
          '/graph': (BuildContext context) => GraphPage(),
          '/compare': (BuildContext context) => ComparePage(),
          '/power': (BuildContext context) => PowerPage(),
        },
        theme: new ThemeData(
            scaffoldBackgroundColor: const Color(0xFFFF),
            unselectedWidgetColor: Colors.red),
        home: Scaffold(
            appBar: AppBar(
                title: Text('Mock Test Options'),
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    minimumSize: Size(30, 30),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/compare', arguments: {
                      'chart': selectedChart,
                      'Age': age,
                      'Gender': gender,
                      'Condition': condition,
                      'Severity': severity,
                    });
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

class Graph extends State<GraphPage> {
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
          '/retake': (BuildContext context) => RetakeTest(),
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
                      width: MediaQuery.of(context).size.width,
                      height:
                          12 * (MediaQuery.of(context).size.height / 2) / 16,
                      child: SfCartesianChart(
                        title: ChartTitle(text: 'Eyes Open Accelerometer Data'),
                        legend: Legend(isVisible: true),
                        backgroundColor: Colors.white,
                        series: <ChartSeries>[
                          LineSeries<Data, double>(
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
                            edgeLabelPlacement: EdgeLabelPlacement.shift),
                        primaryYAxis: NumericAxis(
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
                                Navigator.of(context).pushNamed('/power');
                              },
                              child: Text("Power Graph"),
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
          '/retake': (BuildContext context) => RetakeTest(),
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
        '/retake': (BuildContext context) => RetakeTest(),
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

class Data {
  double time;
  double x;
  double y;
  double z;
  double power;

  Data(this.time, this.x, this.y, this.z, this.power);
}
