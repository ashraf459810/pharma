import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        fontSize: fontsize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.normal),
  );
}
