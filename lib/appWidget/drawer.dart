import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';




class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return (
     
           Container(
            color: Colors.white,
            child: SizedBox(
              width: w(280),
              child: Column(
                children: [
                  SizedBox(
                    height: h(30),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w(10),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 40.sp,
                            color: Colors.black
                            ,
                          ),
                          onPressed: () => Navigator.of(context).pop()),
                    ],
                  ),
                  SizedBox(height: h(30),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                    Container(
                        alignment: Alignment.centerRight,
                      width: w(120),
                      child: text(text: 'عروض جديدة',color:Colors.black,fontsize: 20.sp,fontWeight: FontWeight.bold)),

                    SvgPicture.asset('assets/images/newOffers.svg',height: h(30),width: w(30),)

                  ],),
                    SizedBox(height: h(30),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                    Container(
                      alignment: Alignment.centerRight,
                  width: w(120),
                      child: text(text: 'المحادثات',color:Colors.black,fontsize: 20.sp,fontWeight: FontWeight.bold)),

                    SvgPicture.asset('assets/images/chats.svg',height: h(30),width: w(30),)

                  ],),

                          SizedBox(height: h(30),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                    Container(
        
                      alignment: Alignment.centerRight,
                  width: w(140),
                      child: text(text: 'سجل العمليات',color:Colors.black,fontsize: 20.sp,fontWeight: FontWeight.bold)),

                    SizedBox(width: w(50),
                      child: SvgPicture.asset('assets/images/operation.svg',height: h(30),width: w(30),color: Colors.black87,))

                  ],),


                          SizedBox(height: h(30),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                    Container(
              
                      alignment: Alignment.centerRight,
                  width: w(140),
                      child: text(text: 'اصنافي المعروضة',color:Colors.black,fontsize: 20.sp,fontWeight: FontWeight.bold)),

                    SizedBox(
                      
                      child: SvgPicture.asset('assets/images/type.svg',height: h(30),width: w(30),color: Colors.black87,))

                  ],),

              

                          SizedBox(height: h(30),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                    Container(
              
                      alignment: Alignment.centerRight,
                  width: w(140),
                      child: text(text: 'تسجيل حساب فرعي',color:Colors.black,fontsize: 20.sp,fontWeight: FontWeight.bold)),

                    SizedBox(
                      
                      child: SvgPicture.asset('assets/images/correct.svg',height: h(30),width: w(30),color: Colors.black87,))

                  ],),

                
                
                
                SizedBox(height: h(50),),

                Center(child: container(hight: 1,width: w(250),color: AppColor.grey),),

                SizedBox(height: h(30),),
     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                    Container(
              
                      alignment: Alignment.centerRight,
                  width: w(140),
                      child: text(text: 'ملف الصيدلية',color:Colors.black,fontsize: 20.sp,fontWeight: FontWeight.bold)),

                    SizedBox(
                      
                      child: SvgPicture.asset('assets/images/file.svg',height: h(30),width: w(30),color: Colors.black87,))

                  ],),
              SizedBox(height: h(30),),
     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                    Container(
              
                      alignment: Alignment.centerRight,
                  width: w(140),
                      child: text(text: 'المعلومات الشخصية',color:Colors.black,fontsize: 20.sp,fontWeight: FontWeight.bold)),

                    SizedBox(
                      
                      child: SvgPicture.asset('assets/images/prof.svg',height: h(30),width: w(30),color: Colors.black87,))

                  ],),

                  SizedBox(height: h(50),),


     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                    Container(
              
                      alignment: Alignment.centerRight,
                  width: w(140),
                      child: text(text: 'تسجيل الخروج',color:Colors.red,fontsize: 16.sp,fontWeight: FontWeight.bold)),

                    SizedBox(
                      
                      child: SvgPicture.asset('assets/images/logOut.svg',height: h(30),width: w(30),))

                  ],),


                
                

                
                
                    ],
                
                
              ),
            ),
          )
    );
  }
  navigation (Widget widget){
    Navigator.of(context).pop();
    nav(context, widget);
  }

}
