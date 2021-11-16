import 'package:flutter/material.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/Widgets/TextForm.dart';

Widget pharmacymainbranchphone(String desc,
    TextEditingController textEditingController, String hint, Function value) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              child: Padding(
            padding: EdgeInsets.only(left: w(100)),
            child:
                text(text: desc, color: Colors.black, textAlign: TextAlign.end),
          )),
        ],
      ),
      // SizedBox(
      //   height: h(6),
      // ),
      container(
          hight: h(50),
          width: w(150),
          // width: w(130),
          borderRadius: 40,
          bordercolor: AppColor.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: w(130),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: textform(
                      validation: "number",
                      controller: textEditingController,
                      function: value,
                      hint: hint,
                      hintColor: AppColor.grey,
                      hintsize: 14),
                ),
              ),
            ],
          )),
    ],
  );
}
