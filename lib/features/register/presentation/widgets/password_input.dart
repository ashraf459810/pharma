import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/Widgets/TextForm.dart';

class PaswordInput extends StatefulWidget {
  final String desc;
  final String hint;
  final bool issecure;
  final TextEditingController controller;
  final Widget widgett ;
 final Function function ;


  PaswordInput({Key key, this.desc, this.hint, this.issecure, this.controller, this.widgett, this.function}) : super(key: key);

  @override
  State<PaswordInput> createState() => _PaswordInputState();
}

class _PaswordInputState extends State<PaswordInput> {
  bool issecure = false;
  @override
  Widget build(BuildContext context) {
    return passwordinput(controller: widget.controller, desc: widget.desc,hint: widget.hint,value: widget.function,widgett: widget.widgett);
  }

  Widget passwordinput(
      {String desc,
      String hint,
    
      TextEditingController controller,
      Function value,
      Widget widgett,
      }) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: w(25)),
                child: Container(
                    width: w(180),
                    child: text(
                        text: desc,
                        color: Colors.black,
                        textAlign: TextAlign.end)),
              ),
            ],
          ),
          SizedBox(
            height: h(6),
          ),
          container(
              hight: h(60),
              width: w(343),
              borderRadius: 40,
              bordercolor: AppColor.grey,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                      
                          issecure ? issecure = false : issecure = true;
                
                        });
                      },
                      child: Container(
                          width: w(70), child: widgett ?? Container())),
                  Container(
                    width: w(250),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: textform(
                        
                        validation: 'password',
                          controller: controller,
                          function: value,
                          hint: hint,
                          hintColor: AppColor.grey,
                          hintsize: 14.sp,
                          issecure: issecure),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
