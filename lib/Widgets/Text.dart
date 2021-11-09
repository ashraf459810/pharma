import 'package:flutter/material.dart';

Widget text(
    {String text,
    Color color,
    double fontsize,
    FontWeight fontWeight,
    String fontfamily}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontFamily: fontfamily ?? "font",
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight ?? FontWeight.normal),
  );
}
