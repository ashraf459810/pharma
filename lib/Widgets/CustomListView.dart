import 'package:flutter/material.dart';

Widget customlistview(
    {final double hight,
    final double width,
    final int itemcount,
    final direction,
    final double padding,
    final controller,
    final bool scroll,
    Function function}) {
  return Container(
    height: hight,
    width: width,
    child: ListView.builder(
        physics: ScrollPhysics(
            parent: scroll
                ? AlwaysScrollableScrollPhysics()
                : NeverScrollableScrollPhysics()),
        shrinkWrap: true,
        controller: controller ?? ScrollController(),
        padding: EdgeInsets.symmetric(vertical: padding) ?? EdgeInsets.all(10),
        itemCount: itemcount,
        scrollDirection:
            direction == "vertical" ? Axis.vertical : Axis.horizontal,
        itemBuilder: function),
  );
}
