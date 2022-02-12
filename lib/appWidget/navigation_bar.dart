import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/features/homePage/HomePage.dart';


class NavigateBar extends StatefulWidget {
  NavigateBar({Key key}) : super(key: key);

  @override
  State<NavigateBar> createState() => _NavigateBarState();
}

class _NavigateBarState extends State<NavigateBar> {
  @override
  Widget build(BuildContext context) {
    return navigationBar();
  }


Widget navigationBar ( ){

  return Container(alignment: Alignment.bottomCenter,
    color: Colors.white,height: h(70),width: w(375)
    ,child:
     Padding(
       padding:  EdgeInsets.only(top: h(10)),
       
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
              InkWell(
         onTap: (){nav(context, HomePage());},
         child:
           Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,children: [
                SvgPicture.asset('assets/images/Discount.svg'),
                text(text: 'عروض',fontWeight: FontWeight.bold)
           ],)),
         InkWell(onTap: (){
           nav(context, HomePage(index: 1,));
         },
           child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,children: [
                
                      SvgPicture.asset('assets/images/type.svg'),
                  text(text: 'تحويل',fontWeight: FontWeight.bold)
            
             ],),
         ),
         InkWell(
           onTap:  (){
              nav(context, HomePage(index: 2,));
           },
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
             children: [
               SvgPicture.asset('assets/images/operation.svg'),
                
                 text(text: 'عمليات',fontWeight: FontWeight.bold)
             
            
             ],),
         )
         ],),
       ),
     );
}}