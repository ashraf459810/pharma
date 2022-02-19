

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

import 'package:pharma/appWidget/appButton.dart';
import 'package:pharma/appWidget/inputContainer.dart';
import 'package:pharma/features/homePage/HomePage.dart';
import 'package:pharma/features/login/presentation/bloc/login_bloc.dart';
import 'package:pharma/features/register/presentation/pages/Register.dart';
import 'package:pharma/features/register/presentation/widgets/password_input.dart';
import 'package:toast/toast.dart';

import '../../../../injection.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
   final formKey = GlobalKey<FormState>();
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
            hight: MediaQuery.of(context).size.height,
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

                validation: 'email',
                  desc: "البريد الالكتروني",
                  controller: emailc,
                  hint: "mohammad@hotmail.com",
                  value: (val) {
                    email = val;
                  }),
              SizedBox(
                height: h(12),
              ),
              PaswordInput(
               
                  desc: "كلمة المرور",
                  controller: passwordc,
                  hint: "ادخل كلمة المرور",
                  function: (val) {
                    passwrod = val;
                  },
                  widgett: SvgPicture.asset(
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
                                  
                        GestureDetector(
                      onTap: () {
       
                        if (email !=null &&passwrod !=null){
                     log('here');
                            context.read<LoginBloc>().add(GetUseLoginEvent(email, passwrod));
              
                            }
                          else {
                            Toast.show('يرجى استكمال المعلومات', context , gravity: 2);
                          }
                      

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
                    width: w(130),
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

 
}
