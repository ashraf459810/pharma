import 'package:flutter/material.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Dropdown.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/Widgets/TextForm.dart';

Widget inputDrop({
  String desc,
  String hint,
  String chosenvalue,
  Function value,
  String theValue,
  Widget widget,
  dynamic list,
}) {
  return Center(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                width: w(110), child: text(text: desc, color: Colors.black)),
          ],
        ),
        SizedBox(
          height: h(6),
        ),
        container(
            hight: h(70),
            width: w(343),
            borderRadius: 40,
            bordercolor: AppColor.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: w(250),
                    child: DropDown(
                      chosenvalue: chosenvalue,
                      list: list,
                      getindex: () {},
                      hint: hint,
                      onchanged: () {},
                    )),
                Container(width: w(50), child: widget ?? Container())
              ],
            )),
      ],
    ),
  );
}
