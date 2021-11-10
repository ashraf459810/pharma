import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/CustomListView.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/HomePageAppbar.dart';

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
                      child: text(text: "ملف المستودع", color: Colors.black))),
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
          // SizedBox(
          //   height: h(50),
          // ),
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
                fontsize: 16,
                fontWeight: FontWeight.bold),
          ),
          container(
            width: w(140),
            hight: h(60),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("assets/images/call.svg"),
                  PopupMenuButton(
                      iconSize: 30,
                      icon: SvgPicture.asset(
                        "assets/images/message.svg",
                        fit: BoxFit.cover,
                      ),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text("خدمة الزبائن"),
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: Text("مندوب المبيعات"),
                              value: 2,
                            )
                          ]),
                  SvgPicture.asset("assets/images/location.svg"),
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
