import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';

import 'package:pharma/Widgets/Nav.dart';


import 'package:pharma/appWidget/RegisterAppBar.dart';
import 'package:pharma/appWidget/appButton.dart';
import 'package:pharma/appWidget/inputContainer.dart';
import 'package:pharma/features/login/presentation/pages/login.dart';
import 'package:pharma/features/register/data/models/register_pharma_request_model.dart';
import 'package:pharma/features/register/presentation/bloc/register_bloc.dart';
import 'package:pharma/features/register/presentation/widgets/password_input.dart';
import 'package:toast/toast.dart';

import '../../../../injection.dart';

class PersonalInfo extends StatefulWidget {
  final List<XFile> images;
  final RegisterPharmaRequestodel registerPharmaRequestodel;
  PersonalInfo({Key key, this.images, this.registerPharmaRequestodel})
      : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController passwordc = TextEditingController();
  TextEditingController repasswordc = TextEditingController();
  String email;
  String name;
  String number;
  String iscolored = "2";
  bool issecure = false;
  String password;
  String repasswrod;
 final formKey = GlobalKey<FormState>();
 @override
  void initState() {
        log(widget.images.length.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterBloc>(),
      child: Scaffold(
       
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: CustomAppBar(
                title: "المعلومات الشخصية",
                iscolored: iscolored,
              ),
            )),
        body: SingleChildScrollView(
          child: Form(
 key: formKey,
            child: Column(
              children: [
                // SizedBox(
                //   height: h(20),
                // ),
                inputContainer(
                  validation: 'email',
                  desc: "      البريد الإلكتروني",
                  controller: TextEditingController(),
                  hint: "mohammad@gmail.com",
                  value: (val) {
                    email = val;
                  },
                ),
                SizedBox(
                  height: h(17),
                ),
                inputContainer(
                  validation: 'name',
                    desc: "       اسم االمستخدم",
                    controller: TextEditingController(),
                    hint: "mohammad ali",
                    value: (val) {
                      name = val;
                    }),
                SizedBox(
                  height: h(17),
                ),
                inputContainer(
                    desc: "رقم الهاتف الشخصي",
                    controller: TextEditingController(),
                    hint: "0798327894",
                    validation: "number",
                    value: (val) {
                      number = val;
                    }),
                SizedBox(
                  height: h(17),
                ),
                PaswordInput(
          
                  issecure:  issecure,
                    controller: passwordc,
                    desc: "كلمة المرور",
                    hint: "m1o2h3a4h4",
                    function: (val) {
                      password = val;
                      log(password);
                    },
                    
                    widgett: SvgPicture.asset(
                      "assets/images/passwordeye.svg",
                      height: h(30),
                      width: w(30),
                    )),
                SizedBox(
                  height: h(17),
                ),
                PaswordInput(
                  issecure: issecure,
                    controller: repasswordc,
                    desc: "تأكيد كلمة المرور     ",
                    hint: "m1o2h3a4h4",
                    function: (val) {
                      repasswrod = val;
                    },
                    widgett: SvgPicture.asset(
                      "assets/images/passwordeye.svg",
                      height: h(30),
                      width: w(30),
                    )),
                SizedBox(
                  height: h(40),
                ),
                Builder(
                  builder: (context) {
                    return InkWell(
                        onTap: () {
                          if (formKey.currentState.validate()){
          
                          
                    if (email !=null && name !=null && number!=null  ){
          
                      if (password != null && repasswrod !=null && password == repasswrod){
                 
          
                        widget.registerPharmaRequestodel.password = password;
                        widget.registerPharmaRequestodel.email = email;
                        widget.registerPharmaRequestodel.phone = number;
                        widget.registerPharmaRequestodel.name = name;
                  log(widget.images.length.toString());
          
                      context.read<RegisterBloc>().add(RegisterPharmaEvent(widget.registerPharmaRequestodel , widget.images));
          
                    }
                      else {
                               Toast.show("يرجى التاكد من كلمة السر", context,gravity: 2);
          
                             } }
                         else {Toast.show('الرجاء اكمال المعلومات اولا', context,gravity: 2);}
                             }  } ,
            
                        child: BlocConsumer<RegisterBloc, RegisterState>(
                     listener: (context, state) {
                      if (state is Error ){
                        Toast.show(state.error, context,gravity: 2);
                      }
          
                      if (state is GetRegisterState ){
          
                            nav(context, SignIn());
          
                      }
          
                      },
                      builder: (context, state) {
                        if (state is Loading){
                          return Center(child: CircularProgressIndicator());
                        }
                            return appbutton(
                                AppColor.blue, "التالي", FontWeight.bold);
                          
                        }  ));
                  }
                ),
                SizedBox(
                  height: h(17),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
