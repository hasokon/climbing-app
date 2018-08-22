import 'package:flutter/material.dart';
import 'dart:ui';

Widget createInputTextField({
  String fieldName,
  String histText,
  ValueSetter<String> onSubmitted,
  EdgeInsetsGeometry padding,
  TextStyle fieldNameStyle,
  TextStyle valueStyle,
  TextStyle hintStyle,
}) {
  return Container(
    padding: padding,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              fieldName,
              style: fieldNameStyle,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: TextField(
                textAlign: TextAlign.right,
                style: valueStyle,
                onSubmitted: onSubmitted,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: histText,
                  hintStyle: hintStyle,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
