import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  Time createState() => Time();
}

class Time extends State<TimePage> {
  int dropdownValue = 20;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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