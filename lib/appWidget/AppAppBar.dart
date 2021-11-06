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
            leading: Padding(
              padding: const EdgeInsets.only(bottom: 22.0),
            ),
            foregroundColor: Colors.grey[50],
            backgroundColor: Colors.grey[50],
            elevation: 0,
            actions: [
              Container(
                child: Column(
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
                          Container(
                            height: h(40),
                            child: text(
                                text: widget.title,
                                color: Colors.black,
                                fontsize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, right: 10),
                              child: Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h(20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          preferredSize: Size.fromHeight(100)),
    );
  }
}
