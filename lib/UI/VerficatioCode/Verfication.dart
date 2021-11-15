import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/UI/homePage/HomePage.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/RegisterAppBar.dart';
import 'package:pharma/appWidget/appButton.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class Verfication extends StatefulWidget {
  Verfication({Key key}) : super(key: key);

  @override
  _VerficationState createState() => _VerficationState();
}

class _VerficationState extends State<Verfication> {
  String iscolored = "3";
  String number = "09191919";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: CustomAppBar(
              title: "التحقق",
              iscolored: iscolored,
            ),
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: h(80),
              ),
              text(
                  text: "الرجاء إدخال رمز التحقق",
                  fontsize: 25.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: h(7),
              ),
              // ignore: unnecessary_brace_in_string_interps
              text(text: "${number} " + "تم إرسال رمز التحقق الى الرقم"),
              SizedBox(
                height: h(60),
              ),
              PinCodeTextField(
                pinBoxColor: Colors.transparent,
                defaultBorderColor: AppColor.grey,
                controller: TextEditingController(),
                maxLength: 4,
                pinBoxRadius: 10,
                pinBoxHeight: h(100),
                pinBoxWidth: w(70),
                pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 10),
                hasTextBorderColor: Colors.green,
                pinTextStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  text(
                      text: "إعادة إرسال رمز التحقق",
                      color: AppColor.blue,
                      fontWeight: FontWeight.bold),
                  text(text: "لم اتلقى اي رسالة"),
                ],
              ),
              SizedBox(
                height: h(120),
              ),
              InkWell(
                  onTap: () {
                    nav(context, HomePage());
                  },
                  child: appbutton(AppColor.blue, "تأكيد", FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
