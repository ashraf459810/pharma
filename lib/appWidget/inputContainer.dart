import 'package:flutter/material.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/Widgets/TextForm.dart';

Widget inputContainer(
    {String desc,
    String hint,
    TextEditingController controller,
    Function value,
    String theValue,
    String validation,
    Widget widget,
    Function ontap}) {
  return Center(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                width: w(140),
                child: Center(child: text(text: desc, color: Colors.black))),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: w(250),
                  child: textform(
                      validation: validation ?? "name",
                      controller: controller,
                      function: value,
                      hint: hint,
                      hintColor: AppColor.grey,
                      hintsize: 14),
                ),
                Container(width: w(50), child: widget ?? Container())
              ],
            )),
      ],
    ),
  );
}
