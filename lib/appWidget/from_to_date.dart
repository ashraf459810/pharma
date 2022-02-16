import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Text.dart';


class FromToDate extends StatefulWidget {
  final String desc;
  final Function getDate;
  FromToDate({Key key, this.desc, this.getDate}) : super(key: key);
  @override
  State<FromToDate> createState() => _FromToDateState();
}

class _FromToDateState extends State<FromToDate> {
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [

      Container(
        width: w(130),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                child: text(
                    text: widget.desc,
                    color: Colors.black,
                    textAlign: TextAlign.start)),
          ],
        ),
      ),
      // SizedBox(
      //   height: h(6),
      // ),
              GestureDetector(onTap: (){
             DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2019, 6, 7),
                      maxTime: DateTime.now(),
                      theme: DatePickerTheme(
                          headerColor: Colors.grey,
                          backgroundColor: Colors.blue,
                          itemStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          doneStyle:
                              TextStyle(color: Colors.white, fontSize: 16)),
                      onChanged: (date) {

                  
                  }, onConfirm: (date) {
                   dateTime = date;
                   var finalDate =  dateTime.year.toString( )+'-'+ dateTime.month.toString( ) + '-' +dateTime.day.toString( );
widget.getDate(finalDate);
                   setState(() {
                     
                   });
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
          
            child:
      container(
          hight: h(50),
          width: w(150),
          // width: w(130),
          borderRadius: 40,
          bordercolor: AppColor.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: w(130),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child:text(text: dateTime.year.toString( )+'-'+ dateTime.month.toString( ) + '-' +dateTime.day.toString( ),fontsize: 18.sp),
              ),
              )],
          )),
                )  ],
  );
  }
}





