import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/UI/Map/Map.dart';
import 'package:pharma/UI/OrderMedChat/OrderMedChat.dart';
import 'package:pharma/UI/TypeDetails/TypeDetails.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/CustomListView.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:url_launcher/url_launcher.dart';

class PharmaDetails extends StatefulWidget {
  PharmaDetails({Key key}) : super(key: key);

  @override
  _PharmaDetailsState createState() => _PharmaDetailsState();
}

class _PharmaDetailsState extends State<PharmaDetails> {
  List<Type> images = [
    Type("1", "none"),
    Type("2", "none"),
    Type("3", "none"),
    Type("4", "none"),
    Type("5", "none"),
    Type("6", "none"),
    Type("7", "none"),
    Type("8", "none"),
    Type("none", "اخرى"),
    Type("none", "الكل")
  ];
  int clicked;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: text(
            text: "ملف الصيدلية",
            color: Colors.black,
            fontsize: 20.sp,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center),
        foregroundColor: Colors.grey[50],
        backgroundColor: Colors.grey[50],
        elevation: 0,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: h(20),
          ),
          Center(
            child: Container(
              height: h(150),
              width: w(150),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/pharma.png", fit: BoxFit.contain,
                  // height: h(300),
                ),
              ),
            ),
          ),
          container(
            color: Colors.grey[50],
            hight: h(50),
            width: w(200),
            child: Center(
              child: text(
                  text: "صيدلية الشفاء",
                  color: Colors.black,
                  fontsize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          container(
            color: Colors.grey[50],
            width: MediaQuery.of(context).size.width,
            hight: h(60),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      launch("tel://214324234");
                    },
                    child: SvgPicture.asset(
                      "assets/images/call.svg",
                      height: h(35),
                      width: w(35),
                    ),
                  ),
                  // PopupMenuButton(
                  //     iconSize: w(35),
                  // icon:
                  SizedBox(
                    width: w(20),
                  ),
                  GestureDetector(
                    onTap: () {
                      nav(context, OrderMedChat());
                    },
                    child: SvgPicture.asset(
                      "assets/images/message.svg",
                      height: h(35),
                      width: w(35),
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(
                    width: w(20),
                  ),
                  GestureDetector(
                    onTap: () {
                      nav(context, LocationMap());
                    },
                    child: SvgPicture.asset(
                      "assets/images/location.svg",
                      height: h(35),
                      width: w(35),
                    ),
                  ),
                  SizedBox(
                    height: h(40),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: h(20),
          ),
          container(
              color: Colors.white,
              borderRadius: 30,
              hight: h(70),
              width: MediaQuery.of(context).size.width - w(20),
              child: customlistview(
                  controller: ScrollController(),
                  direction: "horizon",
                  hight: h(60),
                  width: MediaQuery.of(context).size.width - w(20),
                  itemcount: images.length,
                  padding: 5,
                  scroll: true,
                  function: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: w(10)),
                      child: GestureDetector(
                          onTap: () {
                            clicked = index;
                            setState(() {});
                          },
                          child: clicked != index
                              ? types(images, index)
                              : Container(
                                  height: h(60),
                                  width: w(60),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.blue,
                                  ),
                                  child: types(images, index))),
                    );
                  })),
          SizedBox(
            height: h(20),
          ),
          customlistview(
              controller: ScrollController(),
              direction: "vertical",
              hight: h(640),
              itemcount: 10,
              scroll: true,
              padding: 10,
              width: MediaQuery.of(context).size.width,
              function: (context, index) {
                return InkWell(
                    onTap: () {
                      nav(context, TypeDetails());
                    },
                    child: typeWidget());
              })
        ],
      ),
    );
  }

  Widget typeWidget() {
    return container(
        hight: h(130),
        width: w(375),
        color: Colors.white,
        borderRadius: 10,
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: w(70),
                        child: text(
                            textAlign: TextAlign.end,
                            text: "صيدلية الشفاء",
                            fontsize: 12.sp),
                      ),
                      Container(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: h(100),
                            maxWidth: w(250),
                          ),
                          child: text(
                              textAlign: TextAlign.end,
                              text:
                                  "Panadol Advance with Optizorb Formulation 48 Tablets",
                              fontsize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      container(
                        hight: h(80),
                        width: w(80),
                        borderRadius: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/images/med.png", fit: BoxFit.contain,
                            height: h(80), width: w(80),
                            // height: h(300),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                typeSpecifications(h(30), w(70), "500 ml"),
                typeSpecifications(h(30), w(70), "الكمية ٤٠٠"),
                typeSpecifications(h(30), w(90), "اضافي ٢٠+٢٠٠"),
                typeSpecifications(h(30), w(100), "تاريخ الانتهاء ١٢/١٢/٢٠٢٢"),
              ],
            )
          ],
        ));
  }

  Widget typeSpecifications(double hight, double width, String textvalue) {
    return (container(
        borderRadius: 20,
        hight: hight,
        width: width,
        child:
            Center(child: text(text: textvalue, textAlign: TextAlign.center)),
        color: Colors.grey[100]));
  }
}

Widget types(List<Type> list, int index) {
  return Container(
      width: w(40),
      height: h(40),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: list[index].image != "none"
              ? SvgPicture.asset(
                  "assets/images/${list[index].image}.svg",
                  fit: BoxFit.scaleDown,
                )
              // : text(text: title, color: Colors.black, fontsize: 12.sp)
              : Container(
                  width: w(40),
                  height: h(40),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: text(
                        text: list[index].title,
                        color: Colors.black,
                        textAlign: TextAlign.center),
                  ))));
}

class Type {
  String image;
  String title;

  Type(this.image, this.title);
}
