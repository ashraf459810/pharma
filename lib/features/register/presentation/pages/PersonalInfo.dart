import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/UI/VerficatioCode/Verfication.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/Widgets/TextForm.dart';
import 'package:pharma/appWidget/RegisterAppBar.dart';
import 'package:pharma/appWidget/appButton.dart';
import 'package:pharma/appWidget/inputContainer.dart';
import 'package:pharma/features/register/data/models/register_pharma_request_model.dart';
import 'package:pharma/features/register/presentation/bloc/register_bloc.dart';
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
            preferredSize: Size.fromHeight(80),
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: CustomAppBar(
                title: "المعلومات الشخصية",
                iscolored: iscolored,
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(
              //   height: h(20),
              // ),
              inputContainer(
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
              passwordinput(
                  controller: passwordc,
                  desc: "كلمة المرور",
                  hint: "m1o2h3a4h4",
                  value: (val) {
                    password = val;
                  },
                  widget: SvgPicture.asset(
                    "assets/images/passwordeye.svg",
                    height: h(30),
                    width: w(30),
                  )),
              SizedBox(
                height: h(17),
              ),
              passwordinput(
                  controller: repasswordc,
                  desc: "تأكيد كلمة المرور     ",
                  hint: "m1o2h3a4h4",
                  value: (val) {
                    repasswrod = val;
                  },
                  widget: SvgPicture.asset(
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
                        

                        
                  if (email !=null && name !=null && number!=null  ){

                    if (password != null && repasswrod !=null && password == repasswrod){
                      log('here'); 

                      widget.registerPharmaRequestodel.password = password;
                      widget.registerPharmaRequestodel.email = email;
                      widget.registerPharmaRequestodel.phone = number;
                      widget.registerPharmaRequestodel.name = name;
        log(widget.images.length.toString());

                    context.read<RegisterBloc>().add(RegisterPharmaEvent(widget.registerPharmaRequestodel , widget.images));

                  }
                    else {
                             Toast.show("يرجى التاكد من كلمة السر", context,gravity: 1);

                           } }
                       else {Toast.show('الرجاء اكمال المعلومات اولا', context,gravity: 1);}
                           }   ,
  
                      child: BlocConsumer<RegisterBloc, RegisterState>(
                   listener: (context, state) {
                    if (state is Error ){
                      Toast.show(state.error, context);
                    }

                    if (state is GetRegisterState ){

                          nav(context, Verfication());

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
