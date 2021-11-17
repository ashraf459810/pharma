import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            Padding(
              padding: EdgeInsets.only(right: w(30)),
              child: Container(
                  width: w(150),
                  child: text(
                      text: desc,
                      color: Colors.black,
                      textAlign: TextAlign.end)),
            ),
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
                Container(width: w(50), child: widget ?? Container()),
                Container(
                  width: w(250),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: textform(
                        validation: validation ?? "name",
                        controller: controller,
                        function: value,
                        hint: hint,
                        hintColor: AppColor.grey,
                        hintsize: 14.sp),
                  ),
                ),
              ],
            )),
      ],
    ),
  );
}
