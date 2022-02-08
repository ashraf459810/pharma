import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';

import 'package:pharma/Widgets/Container.dart';


import 'drawer.dart';

class HomePageAppBar extends StatefulWidget {

  HomePageAppBar({Key key, }) : super(key: key);

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    container(color: Colors.grey[50],
                      width: w(150),hight: h(60),child: Image.asset('assets/images/logo.png')),
                    SizedBox(width: w(150),),
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
          preferredSize: Size.fromHeight(120)),
    );
  }
}
