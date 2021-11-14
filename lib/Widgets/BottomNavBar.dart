import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtomNavBar extends StatefulWidget {
  final List<NavBarItem> navitems;
  final List<Widget> routes;
  ButtomNavBar({Key key, this.navitems, this.routes}) : super(key: key);

  @override
  _ButtomNavBarState createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widget.routes.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14.sp,
        unselectedFontSize: 14.sp,
        items: navbarlist(widget.navitems),
        currentIndex: selectedIndex,
        selectedIconTheme: IconThemeData(color: Colors.grey, opacity: 0.2),
        selectedItemColor: AppColor.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> navbarlist(List<NavBarItem> items) {
    List<BottomNavigationBarItem> navlist = [];
    for (var i = 0; i < items.length; i++) {
      navlist.add(BottomNavigationBarItem(
        icon: SvgPicture.asset(
          items[i].image,
          color: selectedIndex == i ? AppColor.blue : Colors.grey,
          height: h(30),
          width: w(30),
        ),
        label: items[i].name,
      ));
    }
    return navlist;
  }
}

class NavBarItem {
  String name;
  String image;
  NavBarItem(this.image, this.name);
}
