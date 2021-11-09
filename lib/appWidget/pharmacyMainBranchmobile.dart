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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(child: text(text: desc, color: Colors.black)),
        ],
      ),
      SizedBox(
        height: h(6),
      ),
      container(
          hight: h(70),
          // width: w(130),
          borderRadius: 40,
          bordercolor: AppColor.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: w(150),
                child: textform(
                    controller: textEditingController,
                    function: value,
                    hint: hint,
                    hintColor: AppColor.grey,
                    hintsize: 14),
              ),
            ],
          )),
    ],
  );
}
