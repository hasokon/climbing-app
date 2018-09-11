import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'CreateClimbingLog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Climbing Recoder',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(title: 'Climbing Recoder'),
      routes: {
        '/create': (BuildContext context) => CreateClimbingLog(),
      },
    );
  }
}
