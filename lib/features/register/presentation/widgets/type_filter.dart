import 'package:flutter/material.dart';

import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/Widgets/Text.dart';

// ignore: must_be_immutable
class TypeFilter extends StatefulWidget {
  bool store;
  bool pharmacey;
  bool company;
  Function getType;

  TypeFilter({Key key, this.store, this.pharmacey, this.company,this.getType}) : super(key: key);

  @override
  State<TypeFilter> createState() => _TypeFilterState();
}

class _TypeFilterState extends State<TypeFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:    Container(
             
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.getType('شركة');
                          widget.store = false;
                          // iscolored = "2";
                          widget.pharmacey = false;

                          widget.company = true;
                        });
                      },
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          height:
                              (MediaQuery.of(context).size.width - w(80)) / 2.5,
                          width: w(50),
                          decoration: BoxDecoration(
                            color:
                                widget.company ? Colors.blue[50] : Colors.grey[50],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            border: Border.all(
                              width: w(3),
                              color: widget.company ? AppColor.blue : AppColor.grey,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: text(
                                  text: "شركة",
                                  color: widget.company
                                      ? AppColor.blue
                                      : AppColor.grey,
                                  fontWeight: FontWeight.bold,
                                  fontsize: 18.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(onTap: (){
                       
                          setState(() {
                                widget.getType('مستودع');
                                  widget.pharmacey = false;
                          // iscolored = "1";
                          widget.store = true;

                          widget.company= false;
                            
                          });
                    },
                      child: Container(
                            width:
                                (MediaQuery.of(context).size.width - w(80)) / 2.5,
                            height: w(50),
                            decoration: BoxDecoration(
                              color:
                                  widget.store ? Colors.blue[50] : Colors.grey[50],
                       
                              border: Border.all(
                                width: w(3),
                                color: widget.store ? AppColor.blue : AppColor.grey,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Center(
                              child: text(
                                  text: "مستودع ادوية",
                                  color: widget.store
                                      ? AppColor.blue
                                      : AppColor.grey,
                                  fontWeight: FontWeight.bold,
                                  fontsize: 18.sp),
                            ),
                          ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                                      widget.getType('صيدلية');
                          widget.pharmacey = true;
                          // iscolored = "1";
                          widget.store = false;

                          widget.company= false;
                        });
                      },
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Container(
                          height:
                              (MediaQuery.of(context).size.width - w(60)) / 2.5,
                          width: w(50),
                          decoration: BoxDecoration(
                            color:
                                widget.pharmacey ? Colors.blue[50] : Colors.grey[50],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            border: Border.all(
                              width: w(3),
                              color: widget.pharmacey ? AppColor.blue : AppColor.grey,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: text(
                                  text: "صيدلية",
                                  color: widget.pharmacey
                                      ? AppColor.blue
                                      : AppColor.grey,
                                  fontWeight: FontWeight.bold,
                                  fontsize: 18.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          
    );
  }
}


  enum Type { 
   pharmacy, 
   store, 
   company, 
    
}