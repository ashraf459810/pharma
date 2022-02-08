import 'package:flutter/material.dart';

import 'package:pharma/UI/Operations/Operations.dart';
import 'package:pharma/UI/Transfer/Transfer.dart';
import 'package:pharma/Widgets/BottomNavBar.dart';
import 'package:pharma/features/offers/presentation/pages/offers.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NavBarItem> list = [
    NavBarItem("assets/images/Discount.svg", "عروض"),
    NavBarItem("assets/images/type.svg", "تحويل"),
    NavBarItem("assets/images/operation.svg", "عمليات")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtomNavBar(
        navitems: list,
        routes: [
          Offers(),
          Transfer(),
          Operations(
            isrestore: false,
          )
        ],
      ),
    );
  }
}
