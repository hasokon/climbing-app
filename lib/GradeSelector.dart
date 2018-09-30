import 'package:flutter/material.dart';
import 'Grade.dart';
import 'dart:ui';

Widget createGradeSelector({int value, ValueSetter<int> onChanged, TextStyle style}) {
  List<DropdownMenuItem<int>> items = List();
  for (int i = Grade.MinGrade; i <= Grade.MaxGrade; i++) {
    items.add(DropdownMenuItem<int>(
      value: i,
      child: Text(Grade.getGrade4Japan(i), style: style,),
    ));
  }

  return DropdownButton(
    value: value,
    items: items,
    onChanged: onChanged,
  );
}
