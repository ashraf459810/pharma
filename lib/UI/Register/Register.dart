import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Dropdown.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/AppAppBar.dart';
import 'package:pharma/appWidget/ProgressBar.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool selected1 = true;
  bool selected2 = false;
  List<String> list = ["مالك الصيدلية", "مسؤول الصيدلية ", "صيدلاني"];
  String jobdesc;
  String pramacyname;
  TextEditingController pharmacyc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: CustomAppBar(
                title: "تسجيل الصيدلية",
              ),
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            progressbar("1"),
            SizedBox(
              height: h(45),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected2 = true;
                      selected1 = false;
                    });
                  },
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      height: h(240),
                      width: w(48),
                      decoration: BoxDecoration(
                        color: !selected2 ? Colors.grey[50] : Colors.blue[50],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        border: Border.all(
                          width: 3,
                          color: !selected2 ? AppColor.grey : AppColor.blue,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Center(
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: text(
                              text: "سلسلة صيدليات",
                              color: !selected2 ? AppColor.grey : AppColor.blue,
                              fontWeight: FontWeight.bold,
                              fontsize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected1 = true;
                      selected2 = false;
                    });
                  },
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Container(
                      height: h(240),
                      width: w(48),
                      decoration: BoxDecoration(
                        color: !selected1 ? Colors.grey[50] : Colors.blue[50],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        border: Border.all(
                          width: 3,
                          color: !selected1 ? AppColor.grey : AppColor.blue,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Center(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: text(
                              text: "صيدلية",
                              color: !selected1 ? AppColor.grey : AppColor.blue,
                              fontWeight: FontWeight.bold,
                              fontsize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h(24),
            ),
            inputDrop(
                chosenvalue: jobdesc,
                list: list,
                hint: "مالك صيدلية",
                value: (val) {
                  jobdesc = val;
                },
                desc: "الوصف الوظيفي"),
          ],
        ));
  }

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
              child: Container(
                  width: w(250),
                  child: Center(
                    child: DropDown(
                      chosenvalue: chosenvalue,
                      list: list,
                      getindex: (val) {},
                      hint: hint,
                      onchanged: (val) {},
                    ),
                  ))),
          SizedBox(
            height: h(14),
          ),
          // inputContainer()
        ],
      ),
    );
  }
}
