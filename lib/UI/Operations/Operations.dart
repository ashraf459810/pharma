import 'package:flutter/material.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/UI/Operations/OperationType.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/HomePageAppbar.dart';

class Operations extends StatefulWidget {
  Operations({Key key}) : super(key: key);

  @override
  _OperationsState createState() => _OperationsState();
}

class _OperationsState extends State<Operations> {
  List<String> list = ["نسخة عن فاتورة", "فتح حساب", "إسترجاع", "كشف حساب"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: HomePageAppBar(
            title: "العمليات",
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
            fontsize: 20,
            fontWeight: FontWeight.bold),
      ));
}
