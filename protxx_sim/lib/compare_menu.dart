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
  //page to display mock test options

  String gender = 'Male'; //default gender
  int age = 0; //default age
  String condition = 'Concussion'; //default neuro condition
  int severity = 0; //default severity

  DateTime selectedChart; //data that is passed

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedChart = ModalRoute.of(context).settings.arguments; //assign selectedChart to passed graph data
  }

  //functions to adjust selected variables
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
        theme: new ThemeData(
          //set background to black
            scaffoldBackgroundColor: const Color(0xFFFF),
            unselectedWidgetColor: Colors.red), //make radio buttons red
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
                  Container( //gender radio button selection
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
                  Container( //age slider selection
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
                  Container( //neuro condition dropdown
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
                  Container( //severity slider
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
                        minimumSize: Size(30, 30),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/compare', arguments: { //pass selected parameters to compare screen
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