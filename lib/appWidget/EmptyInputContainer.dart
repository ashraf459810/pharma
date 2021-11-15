import 'package:flutter/material.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Text.dart';

Widget emptyContainer({
  String desc,
  Widget widget,
  double width,
  double hight,
}) {
  return Center(
      child: Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: w(20)),
          child: Container(
              width: w(150),
              child: text(
                  text: desc, color: Colors.black, textAlign: TextAlign.end)),
        ),
      ],
    ),
    SizedBox(
      height: h(6),
    ),
    container(
        hight: hight ?? h(70),
        width: width ?? w(343),
        borderRadius: 40,
        bordercolor: AppColor.grey,
        child: widget)
  ]));
}
