import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/UI/Map/Map.dart';
import 'package:pharma/UI/StoreProfile/StoreProfile.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/CustomListView.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/HomePageAppbar.dart';

class Discount extends StatefulWidget {
  Discount({Key key}) : super(key: key);

  @override
  _DiscountState createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlertDialog(context));

    return Scaffold(
      appBar: PreferredSize(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: HomePageAppBar(
            title: "",
          ),
        ),
        preferredSize: Size.fromHeight(90),
      ),
      body: Container(
        // height: h(700),
        child: ListView(
          scrollDirection: Axis.vertical,
          controller: ScrollController(),
          physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(width: w(60), child: text(text: "مستودعات")),
                SizedBox(
                  height: h(20),
                ),
              ],
            ),
            customlistview(
                controller: ScrollController(),
                direction: "horizon",
                scroll: true,
                hight: h(120),
                itemcount: 10,
                padding: 10,
                width: MediaQuery.of(context).size.width,
                function: (context, index) {
                  return InkWell(
                    onTap: () {
                      nav(context, StoreProfile());
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                          height: h(70),
                          width: w(70),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                              child: Image.asset(
                            "assets/images/roundexample.png",
                            fit: BoxFit.contain,
                          ))),
                    ),
                  );
                }),
            SizedBox(
              height: h(10),
            ),
            customlistview(
                scroll: true,
                hight: h(490),
                width: MediaQuery.of(context).size.width,
                controller: ScrollController(),
                direction: "vertical",
                itemcount: 10,
                padding: 7,
                function: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 17),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return customWidget("assets/images/item.png");
                        }));
                      },
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
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Timer(Duration(seconds: 1), () {
      // Navigator.pop(context);
    });
    // set up the button

    // set up the AlertDialog
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;

                  return Container(
                    height: height - h(700),
                    width: width,
                    child: Center(
                      child: text(
                          text: "اهلا بك",
                          color: AppColor.blue,
                          fontsize: 20.sp),
                    ),
                  );
                },
              ),
            ));
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
                          fit: BoxFit.cover,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/call.svg",
                                  height: h(30),
                                  width: w(30),
                                ),
                                PopupMenuButton(
                                    iconSize: h(30),
                                    icon: SvgPicture.asset(
                                      "assets/images/message.svg",
                                      fit: BoxFit.cover,
                                      height: h(30),
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
                                      height: h(30),
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
      );

  //

}
