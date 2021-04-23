import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import './questions.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  var questionIndex = 0;
  Stream<int> timedCounter(Duration interval, [int maxCount]) async* {
    int i = 0;
    while (true) {
      await Future.delayed(interval);
      yield i++;
      if (i == maxCount) break;
    }
  }
  void listenWithPause() {
    var counterStream = timedCounter(const Duration(seconds: 1), 15);
    StreamSubscription<AccelerometerEvent> subscription;

    subscription = accelerometerEvents.listen((AccelerometerEvent event) {
      print(event); // Print an integer every second
    }
    );
  }


  @override
  Widget build(BuildContext context){
    var questions = ['Whats your favorite color', 'whats your fav animal'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My first App'),
        ),
        body: Column(
            children: [
              Question(questions[questionIndex]),
              RaisedButton(child: Text('Answer 1'), onPressed: listenWithPause),
              RaisedButton(child: Text('Answer 1'), onPressed: listenWithPause),
              RaisedButton(child: Text('Answer 1'), onPressed: listenWithPause),
            ]),
      ),
    );
  }
}