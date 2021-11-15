import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Text.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> profile1 = [
    "الاصناف المعروضة لتحويل",
    "المعلومات الشخصية",
    "معلومات الصيدلية",
    "عملياتي"
  ];
  List<String> profile2 = ["كشف حساب", "استرجاع", "فتح حساب", "نسخة عن فاتورة"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h(60)),
        child: Padding(
          padding: EdgeInsets.only(top: h(8)),
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Center(
                child:
                    text(text: "الحساب", color: Colors.black, fontsize: 20.sp)),
            foregroundColor: Colors.grey[50],
            backgroundColor: Colors.grey[50],
            elevation: 0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h(20),
            ),
            Container(
              height: h(280),
              width: w(300),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: profile1.length,
                itemBuilder: (context, index) {
                  return Container(
                      width: w(100),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: h(20)),
                        child: text(
                            text: profile1[index],
                            textAlign: TextAlign.end,
                            fontsize: 18.sp,
                            color: AppColor.blue,
                            fontWeight: FontWeight.bold),
                      ));
                },
              ),
            ),
            Container(
              height: h(300),
              width: w(300),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: profile1.length,
                itemBuilder: (context, index) {
                  return Container(
                      width: w(100),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: h(20)),
                        child: text(
                            text: profile1[index],
                            textAlign: TextAlign.end,
                            fontsize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ));
                },
              ),
            ),
            SizedBox(
              height: h(30),
            ),
            Padding(
              padding: EdgeInsets.only(left: w(230)),
              child: text(
                  text: "تسجيل الخروج",
                  fontsize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
