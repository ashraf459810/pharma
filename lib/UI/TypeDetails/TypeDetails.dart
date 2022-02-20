import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/UI/Map/Map.dart';
import 'package:pharma/UI/OrderMedChat/OrderMedChat.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/appButton.dart';
import 'package:url_launcher/url_launcher.dart';

class TypeDetails extends StatefulWidget {
  TypeDetails({Key key}) : super(key: key);

  @override
  _TypeDetailsState createState() => _TypeDetailsState();
}

class _TypeDetailsState extends State<TypeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(h(120)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppBar(
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
        ),
      ),
      body: ListView(
        shrinkWrap: true,
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
                  // itemBuilder: (context) => [
                  //       PopupMenuItem(
                  //         child: Text(
                  //           "خدمة الزبائن",
                  //           style: TextStyle(fontSize: 14.sp),
                  //         ),
                  //         value: 1,
                  //       ),
                  //       PopupMenuItem(
                  //         child: Text(
                  //           "مندوب المبيعات",
                  //           style: TextStyle(fontSize: 14.sp),
                  //         ),
                  //         value: 2,
                  //       )
                  //     ]
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
            height: h(40),
          ),
          typeWidget()
        ],
      ),
    );
  }

  Widget typeWidget() {
    return container(
        hight: h(230),
        width: w(375),
        color: Colors.white,
        borderRadius: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
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
              ),
              SizedBox(
                height: h(30),
              ),
              InkWell(
                  onTap: () {
                    nav(context, OrderMedChat());
                  },
                  child: appbutton(AppColor.blue, "طلب الصنف"))
            ],
          ),
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
