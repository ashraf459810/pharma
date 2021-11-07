import 'package:flutter/material.dart';
import 'package:pharma/UI/Transfer/Transfer.dart';
import 'package:pharma/Widgets/BottomNavBar.dart';
import 'package:pharma/appWidget/HomePageAppbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NavBarItem> list = [
    NavBarItem("assets/images/Discount.svg", "عروض"),
    NavBarItem("assets/images/transfer.svg", "تحويل")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: HomePageAppBar(
              title: "",
            ),
          )),
      body: ButtomNavBar(
        navitems: list,
        routes: [HomePage(), Transfer()],
      ),
    );
  }
}
