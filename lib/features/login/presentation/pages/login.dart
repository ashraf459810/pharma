import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';

import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/Widgets/TextForm.dart';
import 'package:pharma/appWidget/appButton.dart';
import 'package:pharma/appWidget/inputContainer.dart';
import 'package:pharma/features/homePage/HomePage.dart';
import 'package:pharma/features/login/presentation/bloc/login_bloc.dart';
import 'package:pharma/features/register/presentation/pages/Register.dart';
import 'package:toast/toast.dart';

import '../../../../injection.dart';

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
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: Scaffold(
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
                  desc: "كلمة المرور",
                  controller: passwordc,
                  hint: "ادخل كلمة المرور",
                  value: (val) {
                    passwrod = val;
                  },
                  widget: SvgPicture.asset(
                    "assets/images/passwordeye.svg",
                    height: h(30),
                    width: w(30),
                  )),
              SizedBox(
                height: h(30),
              ),
   BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                         if (state is Error){
                           Toast.show(state.error, context,gravity: 2);
                           
                         }
                         if (state is GetLoginState ){
                           nav(context, HomePage());
                         }
                        },
                        builder: (context, state) {

                          if (state is Loading){
                            return Center(child: CircularProgressIndicator());
                          }
                          return 
                                  
            InkWell(
                      onTap: () {
                        log('here');
                            context.read<LoginBloc>().add(GetUseLoginEvent(email, passwrod));
                      },
                      child: appbutton(
                              AppColor.blue, "تسجيل الدخول", FontWeight.bold));
                        
     


                
    }  
   ),
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
                    child: text(
                        text: "ليس لديك حساب ؟",
                        color: AppColor.grey,
                        textAlign: TextAlign.center),
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
                  child: appbutton(
                    Colors.black,
                    "انشاء حساب",
                    FontWeight.bold,
                  )),
              SizedBox(
                height: h(44),
              ),
              InkWell(
                onTap: () {
                  nav(context, HomePage());
                },
                child: container(
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
                    )),
              )
            ],
          )),
        ),
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
              Padding(
                padding: EdgeInsets.only(right: w(20)),
                child: Container(
                    width: w(110),
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
              hight: h(70),
              width: w(343),
              borderRadius: 40,
              bordercolor: AppColor.grey,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          print("here");
                          issecure ? issecure = false : issecure = true;
                        });
                      },
                      child: Container(
                          width: w(70), child: widget ?? Container())),
                  Container(
                    width: w(250),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: textform(
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
