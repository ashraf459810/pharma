import 'package:flutter/material.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';

Widget progressbar(String iscolored) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      container(
          hight: h(6),
          width: w(375) / 3,
          color: iscolored == "3" ? AppColor.blue : Colors.blue[100]),
      container(
          hight: h(6),
          width: w(375) / 3,
          color: iscolored == "2" ? AppColor.blue : Colors.blue[100]),
      container(
          hight: h(6),
          width: w(375) / 3,
          color: iscolored == "1" ? AppColor.blue : Colors.blue[100])
    ],
  );
}
