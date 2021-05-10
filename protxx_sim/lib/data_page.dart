import 'package:flutter/material.dart';

import 'new_test.dart';
import 'compare.dart';
import 'power.dart';
import 'graph.dart';
import 'compare_menu.dart';
import 'test.dart';
import 'time.dart';

class DataPage extends StatefulWidget {
  DataP createState() => DataP();
}

class DataP extends State<DataPage> {
  final List names = testsOpen.keys.toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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