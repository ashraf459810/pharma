 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/UI/Map/Map.dart';
import 'package:pharma/UI/SupportOrSalesChat/SupportAndSalesChat.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:url_launcher/url_launcher.dart';
class CompanyProfile extends StatefulWidget {
  final String image;
  CompanyProfile({Key key, this.image}) : super(key: key);

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  @override
  Widget build(BuildContext context) {
    return customWidget(widget.image);
  }

Widget customWidget(String image) => Scaffold(
        body: //       child: SafeArea(
            SafeArea(
          child: Card(
            elevation: 4,
            child: Container(
              // height: h(100),
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Hero(
                      tag: "customWidget",
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          image,
                          fit: BoxFit.contain,
                          height: h(400),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h(50),
                    ),
                    Column(
                      children: [
                        Container(
                          height: h(80)
                          
                          ,
                          width: w(80),

                          decoration: BoxDecoration(shape: BoxShape.circle,color: AppColor.blueTrans),
                        
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/images/store.svg", fit: BoxFit.contain,
                              // height: h(300),
                            ),
                          ),
                        ),
                        container(
                          hight: h(50),
                          width: w(100),
                          child: text(
                              text: "شركة سختيان",
                              color: Colors.black,
                              fontsize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        container(
                          width: w(200),
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
                                    width: w(30),
                                  ),
                                ),
                                PopupMenuButton(
                                    onSelected: (val) {
                                      print(val);
                                      if (val == 1)
                                        nav
                                        (
                                            context,
                                            SupportOrSalesChat(
                                              supportOrSales:
                                                  "شركة سختيان/support",
                                            ));
                                      else {
                                        nav(
                                            context,
                                            SupportOrSalesChat(
                                              supportOrSales:
                                                  "شركة سختيان/sales",
                                            ));
                                      }
                                    },
                                    iconSize: h(30),
                                    icon: SvgPicture.asset(
                                      "assets/images/message.svg",
                                      fit: BoxFit.cover,
                                      height: h(35),
                                      width: w(30),
                                    ),
                                    itemBuilder: (context) => [
                                          PopupMenuItem(
                                            child: Text(
                                              "خدمة الزبائن",
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            value: 1,
                                          ),
                                          PopupMenuItem(
                                            child: Text(
                                              "مندوب المبيعات",
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            value: 2,
                                          )
                                        ]),
                                InkWell(
                                    onTap: () {
                                      nav(context, LocationMap());
                                    },
                                    child: SvgPicture.asset(
                                      "assets/images/location.svg",
                                      height: h(35),
                                      width: w(30),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );}