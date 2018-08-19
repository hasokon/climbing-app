import 'package:flutter/material.dart';
import 'ClimbingRecords.dart';
import 'ClimbingChart.dart';
import 'Setting.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _navigateIndex = 0;

  List _childrens = [
   ClimbingRecords,
   ClimbingChart,
   Setting,
  ];

  Widget _selectChild(BuildContext context) => _childrens[_navigateIndex](context);

  Widget _createFloatingActionButton(BuildContext context) {
    if (_navigateIndex != 0) {
      return null;
    }

    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pushNamed('/create'),
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }

  void _tapOnBottomNavigation(int index) {
    setState(() {
      _navigateIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _selectChild(context),
      floatingActionButton: _createFloatingActionButton(context),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _tapOnBottomNavigation,
        currentIndex: _navigateIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            title: Text('Collections'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            title: Text('Chart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Setting'),
          ),
        ],
      ),
    );
  }
}
