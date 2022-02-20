import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/App/app.dart';

import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Text.dart';

Widget appbutton([Color color, String value, FontWeight fontWeight]) {
  return container(
    
      color: color,
      borderRadius: 30,
      hight: h(50),
      width: w(130),
      child: Center(
        child: text(
            text: value,
            color: Colors.white,
            fontsize: 16.sp,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
      ));
}
