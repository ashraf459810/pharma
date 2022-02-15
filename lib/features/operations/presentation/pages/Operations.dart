import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/features/operations/presentation/widgets/OperationType.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/HomePageAppbar.dart';

class Operations extends StatefulWidget {
  final bool isrestore;
  Operations({Key key, this.isrestore}) : super(key: key);

  @override
  _OperationsState createState() => _OperationsState();
}

class _OperationsState extends State<Operations> {
  List<String> list = ["نسخة عن فاتورة", "فتح حساب", "إسترجاع", "كشف حساب"];
  @override
  Widget build(BuildContext context) {
    widget.isrestore
        ? Future.delayed(Duration.zero, () => showAlertDialog(context))
        // ignore: unnecessary_statements
        : {};
    return Scaffold(
      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: HomePageAppBar(
            
          ),
        ),
        preferredSize: Size.fromHeight(100),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: h(70),
            ),
            Container(
              height: h(500),
              child: ListView.builder(
                physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        nav(
                            context,
                            OperationType(
                              operationnumber: index,
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: operationitem(list[index]),
                      ));
                },
              ),
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
                          text: "تم ارسال طلب الاسترجاع بنجاح",
                          color: AppColor.blue,
                          fontsize: 20.sp),
                    ),
                  );
                },
              ),
            ));
  }
}

Widget operationitem(String desc) {
  return container(
      borderRadius: 20,
      color: Colors.white,
      hight: h(80),
      width: w(343),
      child: Center(
        child: text(
            text: desc,
            color: AppColor.blue,
            fontsize: 20.sp,
            fontWeight: FontWeight.bold),
      ));
}
