import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Text.dart';

class BasicAppBar extends StatefulWidget {
  final String title;
  BasicAppBar({Key key, this.title}) : super(key: key);

  @override
  State<BasicAppBar> createState() => _BasicAppBarState();
}

class _BasicAppBarState extends State<BasicAppBar> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
     
      backgroundColor: Colors.grey[50],
      appBar: PreferredSize(
          child: Column(
            children: [
              SizedBox(height: h(20),),
              AppBar(
                title: text(text: widget.title),
                leading: Padding(
                  padding: EdgeInsets.only(bottom: h(22.0)),
                ),
                foregroundColor: Colors.grey[50],
                backgroundColor: Colors.grey[50],
                elevation: 0,
                actions: [
                  Container(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                              SizedBox(width: w(12),),
                        container(color: Colors.grey[50],
                          width: w(150),hight: h(60),child: text(text: widget.title ,color: Colors.black,fontWeight: FontWeight.bold,fontsize: 22.sp)),
 
                          InkWell(
                            onTap: () {
                                      Scaffold.of(context).openEndDrawer();
                            },
                            child: SvgPicture.asset(
                        'assets/images/menu.svg'
                            ),
                          ),
                      
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          preferredSize: Size.fromHeight(100)),
    );
 
  }
}