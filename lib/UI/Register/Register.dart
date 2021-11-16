import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/UI/Personal_Info/PersonalInfo.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Dropdown.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/EmptyInputContainer.dart';
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
  TextEditingController mainbranchmobilec = TextEditingController();
  TextEditingController pharmacylocationc = TextEditingController();
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
              Container(
                width: MediaQuery.of(context).size.width - w(60),
                child: Row(
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
                          height:
                              (MediaQuery.of(context).size.width - w(60)) / 2,
                          width: w(60),
                          decoration: BoxDecoration(
                            color:
                                !selected2 ? Colors.grey[50] : Colors.blue[50],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            border: Border.all(
                              width: w(3),
                              color: !selected2 ? AppColor.grey : AppColor.blue,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: text(
                                  text: "سلسلة صيدليات",
                                  color: !selected2
                                      ? AppColor.grey
                                      : AppColor.blue,
                                  fontWeight: FontWeight.bold,
                                  fontsize: 18.sp),
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
                          height:
                              (MediaQuery.of(context).size.width - w(60)) / 2,
                          width: w(60),
                          decoration: BoxDecoration(
                            color:
                                !selected1 ? Colors.grey[50] : Colors.blue[50],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            border: Border.all(
                              width: w(3),
                              color: !selected1 ? AppColor.grey : AppColor.blue,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: text(
                                  text: "صيدلية",
                                  color: !selected1
                                      ? AppColor.grey
                                      : AppColor.blue,
                                  fontWeight: FontWeight.bold,
                                  fontsize: 18.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h(24),
              ),
              emptyContainer(
                  desc: "مالك صيدلية",
                  widget: Directionality(
                    textDirection: TextDirection.rtl,
                    child: DropDown(
                      chosenvalue: jobdesc,
                      list: list,
                      hint: "مالك صيدلية",
                      onchanged: (val) {
                        jobdesc = val;
                      },
                      getindex: (val) {},
                    ),
                  )),
              SizedBox(
                height: h(17),
              ),
              inputContainer(
                  desc: "اسم الصيدلية",
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
                      validation: "number",
                      hint: "07901231231",
                      value: (val) {
                        pharmacymobile = val;
                      })
                  : Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // height: h(90),
                            child: pharmacymainbranchphone("هاتف الفرع الرئيسي",
                                mainbranchmobilec, "079123123", (val) {
                              mainbranchnumber = val;
                            }),
                          ),
                          pharmacycount(pharmacyCount, "عدد الصيدليات")
                        ],
                      ),
                    ),
              SizedBox(
                height: h(14),
              ),
              inputContainer(
                  desc: "موقع الصيدلية",
                  hint: "شارع الفيحاء",
                  controller: pharmacylocationc,
                  widget: Icon(
                    Icons.pin_drop,
                    color: AppColor.grey,
                    size: w(25),
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
                      Padding(
                        padding: EdgeInsets.only(right: w(20)),
                        child: Container(
                            width: w(150),
                            child: text(
                                text: "السجل التجاري",
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: w(75),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: w(25),
                                color: AppColor.grey,
                              )),
                          Container(
                              width: w(180),
                              child: Padding(
                                padding: EdgeInsets.only(left: w(40)),
                                child: text(
                                    text: "الرجاء ارفاق السجل التجاري",
                                    color: AppColor.grey,
                                    fontsize: 14.sp),
                              )),
                        ],
                      )),
                  SizedBox(
                    height: h(10),
                  ),
                  Container(
                    width: w(300),
                    child: text(
                        text: "يمكن تحميل السجل التجاري لاحقا",
                        color: Colors.yellow[800],
                        fontsize: 14.sp,
                        textAlign: TextAlign.end),
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

  Widget pharmacycount(int count, String desc) {
    return Column(
      children: [
        Container(
          width: w(130),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  child: text(
                      text: desc,
                      color: Colors.black,
                      textAlign: TextAlign.start)),
            ],
          ),
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
                    width: w(22),
                    bordercolor: AppColor.grey,
                    borderRadius: 50,
                    child: Icon(Icons.add, size: w(15), color: Colors.black)),
              ),
              text(text: count.toString()),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pharmacyCount != 1 ? pharmacyCount-- : pharmacyCount = 1;
                    });
                  },
                  child: container(
                      hight: h(25),
                      width: w(22),
                      bordercolor: AppColor.grey,
                      borderRadius: 50,
                      child: Icon(Icons.remove,
                          size: w(15), color: Colors.black))),
            ],
          ),
        ),
      ],
    );
  }
}
