import 'package:flutter/material.dart';
import 'package:pharma/App/app.dart';

import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Text.dart';

Widget appbutton([Color color, String value, FontWeight fontWeight]) {
  return container(
      color: color,
      borderRadius: 30,
      hight: h(65),
      width: w(160),
      child: Center(
          child: text(
              text: value,
              color: Colors.white,
              fontsize: 18,
              fontWeight: fontWeight ?? FontWeight.normal)));
}
