import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';

class DropDown extends StatefulWidget {
  final String chosenvalue;
  final String hint;
  final List<dynamic> list;
  final Function onchanged;
  final Function getindex;
  DropDown(
      {this.chosenvalue, this.hint, this.list, this.onchanged, this.getindex});

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String chosenvalue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>(
      isExpanded: true,
      underline: SizedBox(),
      hint: chosenvalue == null
          ? Padding(
              padding: EdgeInsets.only(right: w(20)),
              child: Text(
                widget.hint,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColor.grey,
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.only(right: w(20)),
              child: Text(chosenvalue,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                  )),
            ),
      items: widget.list.map((dynamic value) {
        return DropdownMenuItem<dynamic>(
            value: value,
            child: value is String
                ? Center(
                    child: new Text(
                    value,
                    style: TextStyle(fontSize: 14.sp),
                  ))
                : Center(
                    child: new Text(
                    value.name,
                    style: TextStyle(fontSize: 18.sp),
                  )));
      }).toList(),
      onChanged: (value) {
        setState(() {
          widget.onchanged(value);
          value is String ? chosenvalue = value : chosenvalue = value.name;
          int index = 0;
          index = widget.list.indexOf(value);
          widget.getindex(index);
        });
      },
    );
  }
}
