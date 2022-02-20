import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';

import 'package:pharma/Widgets/BottomNavBar.dart';

import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/navigation_bar.dart';

import 'company_profile.dart';



class AllOffers extends StatefulWidget {
  AllOffers({Key key}) : super(key: key);

  @override
  State<AllOffers> createState() => _AllOffersState();
}

class _AllOffersState extends State<AllOffers> {
    List<NavBarItem> list = [
    NavBarItem("assets/images/Discount.svg", "عروض"),
    NavBarItem("assets/images/type.svg", "تحويل"),
    NavBarItem("assets/images/operation.svg", "عمليات")
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: PreferredSize(preferredSize: Size.fromHeight(h(70)),child: AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.grey[50],
      elevation: 0,
      title: text(text: "العروض الجديدة",color: Colors.black,fontWeight: FontWeight.bold,fontsize: 20.sp),centerTitle: true,),),


     
        
     
   bottomNavigationBar: NavigateBar() ,
   body: Padding(
     padding: const EdgeInsets.all(8.0),
     child: GridView.builder(
       itemCount: 20,
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
         
         crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 1.1), itemBuilder: (context, index) {
       return  GestureDetector(
         onTap: (){
           nav(context, CompanyProfile(image: 'assets/images/item.png',));
         },
         child: Container(
                         height: h(220),
                              // width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      "assets/images/item.png", fit: BoxFit.cover,
                                      // height: h(300),
                                    ),
                                  ),
       
                                    Positioned(
                                      top: h(80),
                                      left: w(70),
       
                                      
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Container(
                                        height: h(50),
                                    width: w(40),
                              decoration: BoxDecoration(shape: BoxShape.circle,   color:AppColor.blueTrans,border: Border.all(color: Colors.white)),
                                    child: Center(
                                 child: SvgPicture.asset(
                                         "assets/images/store.svg",
                                               height: h(20),
                                         width: w(20),
                                            fit: BoxFit.contain,
                                                                   )),
                                                                        ),
                                             text(text: 'سختيان',fontWeight: FontWeight.bold)
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
       );
       
     },),
   ),
   );
      
      
     
  }
}