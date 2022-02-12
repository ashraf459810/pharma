import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/UI/Map/Map.dart';
import 'package:pharma/UI/StoreProfile/StoreProfile.dart';
import 'package:pharma/UI/SupportOrSalesChat/SupportAndSalesChat.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/CustomListView.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/HomePageAppbar.dart';
import 'package:pharma/appWidget/drawer.dart';
import 'package:pharma/features/offers/presentation/widgets/all_offers.dart';
import 'package:pharma/features/offers/presentation/widgets/company_profile.dart';
import 'package:url_launcher/url_launcher.dart';

class Offers extends StatefulWidget {
  Offers({Key key}) : super(key: key);

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () => showAlertDialog(context));

    return Scaffold(
        endDrawer:    HomeDrawer(),
      appBar: PreferredSize(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: HomePageAppBar(
          
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
            SizedBox(
              height: h(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: w(10)),
                  child: Container(
                      width: w(100),
                      child: text(
                          text: "مستودعات",
                          fontsize: 20.sp,
                          textAlign: TextAlign.end)),
                ),
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
                    child: Column(
                      children: [
                        Container(
                              height: h(70),
                              width: w(70),
                          decoration: BoxDecoration(shape: BoxShape.circle,   color:AppColor.blueTrans,),
                         child: Center(
                             child: SvgPicture.asset(
                           "assets/images/store.svg",
                        height: h(35),
                        width: w(30),
                           fit: BoxFit.contain,
                         )),
                              ),
                              text(text: 'سختيان')
                      ],
                    ),
                    
                  );
                }),
            SizedBox(
              height: h(10),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){nav(context, AllOffers());},
                  child: container(width: w(80,),color: Colors.grey[50],
                              child: text(text: 'عرض الكل',color: AppColor.blue)),
                ),
                    container(
                  width: w(90),
                  color: Colors.grey[50],
               child: text(text: "العروض",fontsize: 18.sp,fontWeight: FontWeight.bold,)),


            ],),
            Container(
                   color: AppColor.blueTrans,
              child: customlistview(
                  scroll: true,
                  hight: h(420),
                  width: MediaQuery.of(context).size.width,
                  controller: ScrollController(),
                  direction: "vertical",
                  itemcount: 10,
                  padding: 7,
                  function: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: h(17),horizontal: w(20)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CompanyProfile(image:"assets/images/item.png");
                          }));
                        },
                        child: Container(
                     height: h(320),
                          // width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  "assets/images/item.png", fit: BoxFit.cover,
                                  // height: h(300),
                                ),
                              ),

                                Positioned(
                                  top: h(220),
                                  left: w(130),

                                  
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Container(
                                                                    height: h(70),
                                                                    width: w(70),
                                                                decoration: BoxDecoration(shape: BoxShape.circle,   color:AppColor.blueTrans,border: Border.all(color: Colors.white)),
                                                               child: Center(
                                                                   child: SvgPicture.asset(
                                                                 "assets/images/store.svg",
                                                              height: h(35),
                                                              width: w(30),
                                                                 fit: BoxFit.contain,
                                                               )),
                                                                    ),
                                                                                 text(text: 'سختيان',fontWeight: FontWeight.bold)
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
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

 

  //

}
