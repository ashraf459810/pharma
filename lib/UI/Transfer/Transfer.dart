import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/CustomListView.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/HomePageAppbar.dart';

class Transfer extends StatefulWidget {
  Transfer({Key key}) : super(key: key);

  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: HomePageAppBar(
            title: "تحويل",
          ),
        ),
        preferredSize: Size.fromHeight(100),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h(20),
            ),
            container(
                color: AppColor.blue,
                hight: h(60),
                width: w(350),
                borderRadius: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text(text: "اضافة صنف", color: Colors.white, fontsize: 20),
                    SizedBox(
                      width: w(10),
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    )
                  ],
                )),
            SizedBox(
              height: h(20),
            ),
            container(
                color: Colors.white,
                hight: h(60),
                width: w(350),
                borderRadius: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      "assets/images/PharmaServ(1).svg",
                    ),
                    text(
                        text: "بحث عن صيدلية او صنف",
                        color: AppColor.grey,
                        fontsize: 20.sp),
                    SizedBox(
                      width: w(10),
                    ),
                  ],
                )),
            SizedBox(
              height: h(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(width: w(60), child: text(text: "صيدليات")),
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
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                          height: h(70),
                          width: w(70),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                              child: Image.asset(
                            "assets/images/pharma.png",
                            fit: BoxFit.contain,
                          ))),
                    ),
                  );
                }),
            SizedBox(
              height: h(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(width: w(60), child: text(text: "الاصناف")),
                SizedBox(
                  height: h(20),
                ),
              ],
            ),
            typeWidget()
          ],
        ),
      ),
    );
  }

  Widget typeWidget() {
    return container(
        hight: h(114),
        width: w(343),
        color: Colors.white,
        borderRadius: 10,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    text(
                        text: "صيدلية الشفاء",
                        color: AppColor.grey,
                        fontsize: 12.sp),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 50, maxWidth: 200),
                      child: text(
                          text:
                              "Panadol Advance with Optizorb Formulation 48 Tablets",
                          fontsize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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
                          "assets/images/med.png", fit: BoxFit.cover,
                          // height: h(300),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: h(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [text(text: "asdasd"), text(text: "asfasfsaf")],
            )
          ],
        ));
  }
}
