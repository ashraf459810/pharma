import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/App/app.dart';

import 'package:pharma/Widgets/Text.dart';

import 'ProgressBar.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final String iscolored;
  CustomAppBar({Key key, this.title, this.iscolored}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: PreferredSize(
          child: AppBar(
            automaticallyImplyLeading: false, // h
            leading: Padding(
              padding: EdgeInsets.only(bottom: h(22.0)),
            ),
            foregroundColor: Colors.grey[50],
            backgroundColor: Colors.grey[50],
            elevation: 0,
            flexibleSpace: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h(25),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: w(30),
                      ),
                      Container(
                        height: h(40),
                        child: text(
                            text: widget.title,
                            color: Colors.black,
                            fontsize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: h(10.0), right: w(10)),
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: w(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                progressbar(widget.iscolored),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(120)),
    );
  }
}
