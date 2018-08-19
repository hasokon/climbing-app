import 'package:flutter/material.dart';

class CreateClimbingLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Climbing Log'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Back'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ));
  }
}
