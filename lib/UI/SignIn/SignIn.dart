import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/UI/Register/REgister.dart';

import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/Widgets/TextForm.dart';
import 'package:pharma/appWidget/appButton.dart';
import 'package:pharma/appWidget/inputContainer.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailc = TextEditingController();
  String email;
  String passwrod;
  bool issecure = true;
  TextEditingController passwordc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: container(
            child: Column(
          children: [
            SizedBox(
              height: h(50),
            ),
            text(
                text: "تسجيل الدخول",
                fontsize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black
                // fontfamily: 'sans'
                ),
            SizedBox(
              height: h(70),
            ),
            inputContainer(
                desc: "البريد الالكتروني",
                controller: emailc,
                hint: "mohammad@hotmail.com",
                value: (val) {
                  email = val;
                }),
            SizedBox(
              height: h(12),
            ),
            passwordinput(
                desc: "       كلمة المرور",
                controller: passwordc,
                hint: "ادخل كلمة المرور",
                value: (val) {
                  passwrod = val;
                },
                widget: SvgPicture.asset("assets/images/passwordeye.svg")),
            SizedBox(
              height: h(30),
            ),
            appbutton(AppColor.blue, "تسجيل الدخول", FontWeight.bold),
            SizedBox(
              height: h(43),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                container(
                    width: MediaQuery.of(context).size.width / 3.3,
                    color: AppColor.grey,
                    hight: 1),
                container(
                  width: MediaQuery.of(context).size.width / 3.3,
                  child: text(text: "ليس لديك حساب ؟", color: AppColor.grey),
                ),
                container(
                    width: MediaQuery.of(context).size.width / 3.3,
                    color: AppColor.grey,
                    hight: 1),
              ],
            ),
            SizedBox(
              height: h(32),
            ),
            InkWell(
                onTap: () {
                  nav(context, Register());
                },
                child:
                    appbutton(Colors.black, "انشاء حساب  ", FontWeight.bold)),
            SizedBox(
              height: h(44),
            ),
            container(
                borderRadius: 30,
                hight: h(65),
                width: w(160),
                bordercolor: AppColor.grey,
                child: Center(
                  child: text(
                      text: "متابعة كضيف",
                      fontWeight: FontWeight.bold,
                      color: AppColor.grey,
                      fontsize: 16.sp),
                ))
          ],
        )),
      ),
    );
  }

  Widget passwordinput(
      {String desc,
      String hint,
      TextEditingController controller,
      Function value,
      Widget widget,
      Function ontap}) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  width: w(110), child: text(text: desc, color: Colors.black)),
            ],
          ),
          SizedBox(
            height: h(6),
          ),
          container(
              hight: h(70),
              width: w(343),
              borderRadius: 40,
              bordercolor: AppColor.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: w(250),
                    child: textform(
                        controller: controller,
                        function: value,
                        hint: hint,
                        hintColor: AppColor.grey,
                        hintsize: 14.sp,
                        issecure: issecure),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          print("here");
                          issecure ? issecure = false : issecure = true;
                        });
                      },
                      child:
                          Container(width: w(70), child: widget ?? Container()))
                ],
              )),
        ],
      ),
    );
  }
}
