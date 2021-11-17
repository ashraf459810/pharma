import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/UI/Map/Map.dart';
import 'package:pharma/UI/SupportOrSalesChat/SupportAndSalesChat.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/CustomListView.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreProfile extends StatefulWidget {
  StoreProfile({Key key}) : super(key: key);

  @override
  _StoreProfileState createState() => _StoreProfileState();
}

class _StoreProfileState extends State<StoreProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              title: Container(
                  width: w(240),
                  child: Center(
                      child: text(
                          text: "ملف المستودع",
                          color: Colors.black,
                          fontsize: 20.sp,
                          fontWeight: FontWeight.bold))),
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
              foregroundColor: Colors.white,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            preferredSize: Size.fromHeight(70)),
        backgroundColor: Colors.white,
        body: Column(children: [
          Center(
            child: Container(
              height: h(150),
              width: w(150),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/company.png", fit: BoxFit.contain,
                  // height: h(300),
                ),
              ),
            ),
          ),
          container(
            hight: h(50),
            width: w(200),
            child: Center(
              child: text(
                  text: "شركة سختيان",
                  color: Colors.black,
                  fontsize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          container(
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
                  PopupMenuButton(
                      onSelected: (val) {
                        print(val);
                        if (val == 1)
                          nav(
                              context,
                              SupportOrSalesChat(
                                supportOrSales: "شركة سختيان/support",
                              ));
                        else {
                          nav(
                              context,
                              SupportOrSalesChat(
                                supportOrSales: "شركة سختيان/sales",
                              ));
                        }
                      },
                      iconSize: w(35),
                      icon: SvgPicture.asset(
                        "assets/images/message.svg",
                        height: h(35),
                        width: w(35),
                        fit: BoxFit.cover,
                      ),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "خدمة الزبائن",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "مندوب المبيعات",
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                              value: 2,
                            )
                          ]),
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
          customlistview(
              scroll: true,
              hight: h(440),
              width: MediaQuery.of(context).size.width,
              controller: ScrollController(),
              direction: "vertical",
              itemcount: 10,
              padding: 1,
              function: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 17),
                  child: GestureDetector(
                    // onTap: () {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) {
                    //     return customWidget("assets/images/item.png");
                    //   }));
                    // },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          "assets/images/item.png", fit: BoxFit.cover,
                          // height: h(300),
                        ),
                      ),
                    ),
                  ),
                );
              })
        ]));
  }
}
