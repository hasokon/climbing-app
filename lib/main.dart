import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'CreateClimbingLog.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Climbing Recoder',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(title: 'Climbing Recoder'),
      routes: {
        '/create': (BuildContext context) => new CreateClimbingLog(),
      },
    );
  }
}