import 'package:flutter/material.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/UI/Personal_Info/PersonalInfo.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Dropdown.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/RegisterAppBar.dart';

import 'package:pharma/appWidget/appButton.dart';

import 'package:pharma/appWidget/inputContainer.dart';
import 'package:pharma/appWidget/pharmacyMainBranchmobile.dart';

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
  String pharmacyname;
  TextEditingController pharmacynamec = TextEditingController();
  TextEditingController pharmacymobilec = TextEditingController();
  String pharmacymobile;
  String mainbranchnumber;
  int pharmacyCount = 1;
  String iscolored = "1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: CustomAppBar(
                title: "تسجيل الصيدلية",
                iscolored: iscolored,
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                        // iscolored = "2";
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
                                color:
                                    !selected2 ? AppColor.grey : AppColor.blue,
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
                        // iscolored = "1";
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
                                color:
                                    !selected1 ? AppColor.grey : AppColor.blue,
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
              SizedBox(
                height: h(17),
              ),
              inputContainer(
                  desc: "       اسم الصيدلية",
                  controller: pharmacynamec,
                  hint: "صيدلية الشفاء",
                  value: (val) {
                    pramacyname = val;
                  }),
              SizedBox(
                height: h(17),
              ),
              selected1
                  ? inputContainer(
                      desc: "رقم هاتف الصيدلية",
                      controller: pharmacymobilec,
                      hint: "07901231231",
                      value: (val) {
                        pharmacymobile = val;
                      })
                  : Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: h(90),
                            child: pharmacymainbranchphone(
                                "رقم هاتف الفرع الرئيسي",
                                TextEditingController(),
                                "079123123", (val) {
                              mainbranchnumber = val;
                            }),
                          ),
                          pharmacycount(
                              pharmacyCount, "                عدد الصيدليات")
                        ],
                      ),
                    ),
              SizedBox(
                height: h(14),
              ),
              inputContainer(
                  desc: "      موقع الصيدلية",
                  hint: "شارع الفيحاء",
                  controller: TextEditingController(text: ""),
                  widget: Icon(
                    Icons.pin_drop,
                    color: AppColor.grey,
                    size: 30,
                  ),
                  value: (val) {}),
              SizedBox(
                height: h(17),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: w(110),
                          child: text(
                              text: "    السجل التجاري", color: Colors.black)),
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
                              child: text(
                                  text: "الرجاء ارفاق السجل التجاري",
                                  color: AppColor.grey,
                                  fontsize: 14)),
                          Container(
                              width: w(50),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 25,
                                color: AppColor.grey,
                              ))
                        ],
                      )),
                  SizedBox(
                    height: h(10),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 180.0),
                    child: Container(
                      width: w(160),
                      child: text(
                          text: "يمكن تحميل السجل التجاري لاحقا",
                          color: Colors.yellow[800],
                          fontsize: 14),
                    ),
                  ),
                  SizedBox(
                    height: h(20),
                  ),
                  InkWell(
                      onTap: () {
                        nav(context, PersonalInfo());
                      },
                      child:
                          appbutton(AppColor.blue, "التالي", FontWeight.bold)),
                  SizedBox(
                    height: h(15),
                  )
                ],
              ),
            ],
          ),
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
                  width: w(110),
                  child: text(text: "   ${desc}", color: Colors.black)),
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
                      onchanged: (val) {
                        desc = val;
                      },
                    ),
                  ))),
        ],
      ),
    );
  }

  Widget pharmacycount(int count, String desc) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(child: text(text: desc, color: Colors.black)),
          ],
        ),
        container(
          hight: h(50),
          width: w(150),
          bordercolor: AppColor.grey,
          borderRadius: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    pharmacyCount++;
                  });
                },
                child: container(
                    hight: h(25),
                    width: w(20),
                    bordercolor: AppColor.grey,
                    borderRadius: 70,
                    child: Center(child: text(text: "+", fontsize: 16))),
              ),
              text(text: count.toString()),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pharmacyCount != 1 ? pharmacyCount-- : pharmacyCount = 1;
                    });
                  },
                  child: container(
                      hight: h(26),
                      width: w(20),
                      bordercolor: AppColor.grey,
                      borderRadius: 70,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: Icon(Icons.minimize,
                              size: 15, color: Colors.black),
                        ),
                      ))),
            ],
          ),
        ),
      ],
    );
  }
}
