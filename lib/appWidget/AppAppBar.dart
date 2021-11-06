import 'package:flutter/material.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Text.dart';

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
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            foregroundColor: Colors.grey[50],
            backgroundColor: Colors.grey[50],
            elevation: 0,
            actions: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: h(10),
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: w(30),
                        ),
                        text(
                            text: widget.title,
                            color: Colors.black,
                            fontsize: 18,
                            fontWeight: FontWeight.bold),
                        Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      container(
                          hight: h(6),
                          width: MediaQuery.of(context).size.width / 3,
                          color: widget.iscolored == "3"
                              ? AppColor.blue
                              : Colors.blue[100]),
                      container(
                          hight: h(6),
                          width: MediaQuery.of(context).size.width / 3,
                          color: widget.iscolored == "2"
                              ? AppColor.blue
                              : Colors.blue[100]),
                      container(
                          hight: h(6),
                          width: MediaQuery.of(context).size.width / 3,
                          color: widget.iscolored == "1"
                              ? AppColor.blue
                              : Colors.blue[100])
                    ],
                  )
                ],
              ),
            ],
          ),
          preferredSize: Size.fromHeight(100)),
    );
  }
}
