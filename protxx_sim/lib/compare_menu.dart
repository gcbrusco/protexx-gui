import 'package:flutter/material.dart';

import 'new_test.dart';
import 'compare.dart';
import 'power.dart';
import 'graph.dart';
import 'data_page.dart';
import 'test.dart';
import 'time.dart';

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