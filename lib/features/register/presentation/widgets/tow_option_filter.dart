import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Text.dart';

// ignore: must_be_immutable
class TwoOptionFilter extends StatefulWidget {
    bool registeredFarmacy;
   bool newFarmacy;

   String option1;
   String option2;
   Function getOption;
 
 

  TwoOptionFilter({Key key, this.registeredFarmacy, this.newFarmacy,this.option1,this.option2, this.getOption}) : super(key: key);

  @override
  State<TwoOptionFilter> createState() => _TwoOptionFilterState();
}

class _TwoOptionFilterState extends State<TwoOptionFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:     Container(
             
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.getOption(widget.option1);
                          widget.registeredFarmacy= true;
                          widget.newFarmacy = false;


                        });
                      },
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          height:
                              (MediaQuery.of(context).size.width - w(80)) /1.7,
                          width: w(50),
                          decoration: BoxDecoration(
                            color:
                                widget.registeredFarmacy ? Colors.blue[50] : Colors.grey[50],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            border: Border.all(
                              width: w(3),
                              color: widget.registeredFarmacy ? AppColor.blue : AppColor.grey,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: text(
                                  text: widget.option1,
                                  color: widget.registeredFarmacy
                                      ? AppColor.blue
                                      : AppColor.grey,
                                  fontWeight: FontWeight.bold,
                                  fontsize: 18.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
             
                    GestureDetector(
                      onTap: () {
                        setState(() {
                                widget.getOption(widget.option2);
                          widget.newFarmacy = true;
                          // iscolored = "1";
                          widget.registeredFarmacy = false;

                          
                        });
                      },
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Container(
                          height:
                              (MediaQuery.of(context).size.width - w(60)) / 1.7,
                          width: w(50),
                          decoration: BoxDecoration(
                            color:
                                widget.newFarmacy ? Colors.blue[50] : Colors.grey[50],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            border: Border.all(
                              width: w(3),
                              color: widget.newFarmacy ? AppColor.blue : AppColor.grey,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: text(
                                  text: widget.option2,
                                  color: widget.newFarmacy
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

