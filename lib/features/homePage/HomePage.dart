import 'package:flutter/material.dart';

import 'package:pharma/features/operations/presentation/pages/Operations.dart';
import 'package:pharma/features/transfer/presentation/pages/Transfer.dart';
import 'package:pharma/Widgets/BottomNavBar.dart';
import 'package:pharma/features/offers/presentation/pages/offers.dart';

class HomePage extends StatefulWidget {
  final int index;
  HomePage({Key key, this.index}) : super(key: key);

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
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtomNavBar(
        index: widget.index ?? 0,
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
