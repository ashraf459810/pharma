import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/CustomListView.dart';
import 'package:pharma/Widgets/Text.dart';

class Notifications extends StatefulWidget {
  Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<String> list = ["تحويل", "محادثات", "عروض", "عمليات"];
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h(60)),
        child: Padding(
          padding: EdgeInsets.only(top: h(8)),
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Padding(
              padding: EdgeInsets.only(left: w(100)),
              child: text(
                  text: "الاشعارات",
                  color: Colors.black,
                  fontsize: 20.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold),
            ),
            foregroundColor: Colors.grey[50],
            backgroundColor: Colors.grey[50],
            elevation: 0,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          controller: ScrollController(),
          children: [
            operationslist(
              list,
            ),
            SizedBox(
              height: h(10),
            ),
            customlistview(
                controller: ScrollController(),
                direction: "vertical",
                itemcount: 50,
                hight: h(680),
                scroll: true,
                width: w(200),
                padding: 60,
                function: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: h(10), horizontal: w(15)),
                    child: container(
                        hight: h(50),
                        width: w(100),
                        color: Colors.white,
                        borderRadius: 30,
                        child: text(text: "تحويل", fontsize: 15.sp)),
                  );
                })
          ],
        ),
      ),
    );
  }

  Widget operationslist(
    List<String> list,
  ) {
    return container(
        color: Colors.white,
        borderRadius: 40,
        width: w(400) - w(40),
        hight: h(80),
        child: customlistview(
            scroll: false,
            controller: ScrollController(),
            direction: "horizn",
            hight: h(70),
            width: MediaQuery.of(context).size.width - w(50),
            itemcount: 4,
            padding: 5,
            function: (context, index) {
              return GestureDetector(
                onTap: () {
                  print("here");
                  setState(() {
                    id = index;
                  });
                },
                child: container(
                  width: w(80),
                  borderRadius: 30,
                  color: id == index ? AppColor.blue : Colors.transparent,
                  child: Center(
                    child: text(
                        text: list[index],
                        color: id == index ? Colors.white : AppColor.grey,
                        fontsize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }));
  }
}
