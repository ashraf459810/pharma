import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Text.dart';

class HomePageAppBar extends StatefulWidget {
  final String title;
  HomePageAppBar({Key key, this.title}) : super(key: key);

  @override
  _HomePageAppBarState createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: PreferredSize(
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(bottom: 22.0),
            ),
            foregroundColor: Colors.grey[50],
            backgroundColor: Colors.grey[50],
            elevation: 0,
            actions: [
              Container(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.notifications,
                          color: AppColor.grey,
                          size: w(25),
                        ),
                      ),
                      Container(
                        height: h(60),
                        width: w(240),
                        child: Center(
                          child: text(
                              text: widget.title,
                              color: Colors.black,
                              fontsize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.person,
                          color: AppColor.grey,
                          size: w(25),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          preferredSize: Size.fromHeight(120)),
    );
  }
}
