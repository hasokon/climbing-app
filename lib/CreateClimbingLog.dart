import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'GradeSelector.dart';
import 'InputTextField4Log.dart';
import 'package:image_picker/image_picker.dart';

class CreateClimbingLog extends StatefulWidget {
  @override
  _CreateClimbingLog createState() => _CreateClimbingLog();
}

class _CreateClimbingLog extends State<CreateClimbingLog> {
  DateTime _selectedDate = DateTime.now();

  int _grade = 7;

  String _placeName = '';

  String _problemName = '';

  File _image = null;

  DateFormat formatter = DateFormat('yyyy年MM月dd日');

  void _selectDate() async {
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 30)),
        lastDate: DateTime.now().add(Duration(days: 30)));

    setState(() {
      _selectedDate = date;
    });
  }

  void _selectGrade(int grade) {
    setState(() {
      _grade = grade;
    });
  }

  void _inputPlaceName(String placeName) {
    setState(() {
      _placeName = placeName;
    });
  }

  void _inputProblemName(String problemName) {
    setState(() {
      _problemName = problemName;
    });
  }

  void _selectPicture() async {
    var image = await ImagePicker
        .pickImage(source: ImageSource.gallery)
        .catchError((error) => debugPrint(error));
    setState(() {
      _image = image;
    });
  }

  void _save() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var nameStyle = TextStyle(fontSize: 25.0, color: Colors.grey);
    var valueStyle = TextStyle(fontSize: 25.0, color: Colors.blueGrey);
    var hintStyle = TextStyle(fontSize: 25.0, color: Colors.grey[300]);

    var padding = EdgeInsets.all(2.0);

    var place = createInputTextField(
        fieldName: '場所',
        histText: 'エリア名orジム名（必須）',
        onSubmitted: _inputPlaceName,
        padding: padding,
        fieldNameStyle: nameStyle,
        valueStyle: valueStyle,
        hintStyle: hintStyle);

    var problemName = createInputTextField(
        fieldName: '課題名',
        histText: '無名',
        onSubmitted: _inputProblemName,
        padding: padding,
        fieldNameStyle: nameStyle,
        valueStyle: valueStyle,
        hintStyle: hintStyle);

    var grade = Container(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'グレード',
            style: nameStyle,
          ),
          createGradeSelector(
            value: _grade,
            onChanged: _selectGrade,
            style: valueStyle,
          )
        ],
      ),
    );

    var date = Container(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '日付',
            style: nameStyle,
          ),
          FlatButton(
            child: Text(
              "${formatter.format(_selectedDate)}",
              style: valueStyle,
            ),
            onPressed: _selectDate,
          )
        ],
      ),
    );

    Widget createImageSelector() {
      if (_image == null) {
        return Container(
          padding: padding,
          child: Center(
            child: RaisedButton(
              child: Text('画像追加'),
              onPressed: _selectPicture,
            ),
          ),
        );
      }

      return Container(
        padding: padding,
        child: FlatButton(
          onPressed: _selectPicture,
          child: Image.file(
            _image,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.8,
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Create Climbing Log'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save_alt),
              tooltip: 'Save',
              onPressed: _save,
              disabledColor: Colors.white,
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              place,
              problemName,
              date,
              grade,
              createImageSelector(),
            ],
          ),
        ));
  }
}
