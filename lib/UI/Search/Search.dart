import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/Widgets/TextForm.dart';
import 'package:pharma/appWidget/HomePageAppbar.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String search;
  TextEditingController searchc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(top: h(10.0)),
          child: HomePageAppBar(
            title: "بحث",
          ),
        ),
        preferredSize: Size.fromHeight(70),
      ),
      body: Center(
        child: Column(
          children: [
            container(
                color: Colors.white,
                hight: h(60),
                width: w(350),
                borderRadius: 30,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        "assets/images/PharmaServ(1).svg",
                        width: w(25),
                        height: h(25),
                      ),
                      Row(
                        children: [
                          Container(
                            height: h(40),
                            width: w(175),
                            child: Center(
                              child: textform(
                                controller: searchc,
                                hint: "بحث عن صيدلية او صنف",
                                function: (val) {
                                  search = val;
                                },
                                hintColor: AppColor.grey,
                                hintsize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: h(200),
            ),
            SvgPicture.asset(
              "assets/images/nodata.svg",
              height: h(100),
              width: w(100),
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: h(20),
            ),
            text(text: "لم يتم العثور على نتائج")
          ],
        ),
      ),
    );
  }
}
