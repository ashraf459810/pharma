import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/features/register/data/models/register_pharma_request_model.dart';

import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Dropdown.dart';

import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/EmptyInputContainer.dart';
import 'package:pharma/appWidget/RegisterAppBar.dart';

import 'package:pharma/appWidget/appButton.dart';

import 'package:pharma/appWidget/inputContainer.dart';
import 'package:pharma/features/register/presentation/pages/PersonalInfo.dart';


import 'package:pharma/features/register/presentation/widgets/tow_option_filter.dart';
import 'package:pharma/features/register/presentation/widgets/type_filter.dart';
import 'package:pharma/features/register/presentation/widgets/upload_photo.dart';
import 'package:toast/toast.dart';


typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterPharmaRequestodel registerPharmaRequestodel;
  bool pharmacey;
  bool store;
  bool company;
  bool newOne;
  bool registered = false;
  String searched;
  List<String> list = ["مالك الصيدلية", "مسؤول الصيدلية ", "صيدلاني"];
  String jobdesc;
  String pramacyname;
  String name;
  TextEditingController searchc = TextEditingController();
  TextEditingController pharmacynamec = TextEditingController();
  TextEditingController pharmacymobilec = TextEditingController();
  TextEditingController mainbranchmobilec = TextEditingController();
  TextEditingController pharmacylocationc = TextEditingController();
  String mobile;
  String mainbranchnumber;
  int pharmacyCount = 1;
  String iscolored = "1";

  var type;
  String registerOrNew;
  String oneBranchOrMany;
  bool branch = false;
  bool series = false;
  XFile tradRecord;
  XFile workLicense;
  XFile id;
  XFile ministryLicense;
  List<XFile> images = [];

  @override
  void initState() {
    pharmacey = false;
    store = false;
    company = false;
    newOne = false;
    registered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: CustomAppBar(
                title: "تسجيل الصيدلية",
                iscolored: iscolored,
              ),
            )),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h(20),
            ),
            SizedBox(
                height: h(75),
                child: TypeFilter(
                    company: company,
                    pharmacey: pharmacey,
                    store: store,
                    getType: (val) {
                      setState(() {
                        print(val);
                        type = val;
                        if (type == 'صيدلية') {
                          pharmacey = true;
                          company = false;
                          store = false;
                        } else if (type == 'شركة') {
                          company = true;
                          store = false;
                          pharmacey = false;
                        } else {
                          store = true;
                          pharmacey = false;
                          company = false;
                        }
                      });
                    })),
            SizedBox(
              height: h(20),
            ),
            type != null
                ? SizedBox(
                    height: h(70),
                    child: TwoOptionFilter(
                      registeredFarmacy: registered,
                      newFarmacy: newOne,
                      option1: 'مسجل',
                      option2: 'جديد',
                      getOption: (val) {
                        log(val);

                        setState(() {
                          registerOrNew = val;
                          if (val == 'جديد') {
                            newOne = true;
                            registered = false;
                          } else {
                            newOne = false;
                            registered = true;
                          }
                        });
                      },
                    ))
                : SizedBox(),
            SizedBox(
              height: h(20),
            ),
            !registered
                ? Column(
                    children: [
                      registerOrNew != null
                          ? SizedBox(
                              height: h(70),
                              child: TwoOptionFilter(
                                registeredFarmacy: branch,
                                newFarmacy: series,
                                option1: 'سلسلة',
                                option2: 'فرع وحيد',
                                getOption: (val) {
                                  oneBranchOrMany = val;
                                },
                              ))
                          : SizedBox(),
                      SizedBox(
                        height: h(24),
                      ),
                      emptyContainer(
                          desc: "الوصف الوظيفي",
                          widget: Directionality(
                            textDirection: TextDirection.rtl,
                            child: DropDown(
                              chosenvalue: jobdesc,
                              list: list,
                              hint: "مالك صيدلية",
                              onchanged: (val) {
                                jobdesc = val;
                              },
                              getindex: (val) {},
                            ),
                          )),
                      SizedBox(
                        height: h(17),
                      ),
                      inputContainer(
                          desc: "الاسم",
                          controller: pharmacynamec,
                          hint: "صيدلية الشفاء",
                          value: (val) {
                            name = val;
                          }),
                      SizedBox(
                        height: h(17),
                      ),
                      inputContainer(
                          desc: "رقم الهاتف ",
                          controller: pharmacymobilec,
                          validation: "number",
                          hint: "07901231231",
                          value: (val) {
                            mobile = val;
                          }),
                      SizedBox(
                        height: h(14),
                      ),
                      type != 'شركة'
                          ? Column(
                              children: [
                                inputContainer(
                                    desc: "الموقع",
                                    hint: "شارع الفيحاء",
                                    controller: pharmacylocationc,
                                    widget: Icon(
                                      Icons.pin_drop,
                                      color: AppColor.grey,
                                      size: w(25),
                                    ),
                                    value: (val) {}),
                                SizedBox(
                                  height: h(17),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: w(30)),
                                      child: Container(
                                          width: w(150),
                                          child: text(
                                              text:
                                                  "الرجاءارفاق الوثائق التالية",
                                              color: Colors.black,
                                              textAlign: TextAlign.end)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: h(6),
                                ),
                                SizedBox(
                                    height: h(60),
                                    child: UploadPhoto(
                                      index: 0,
                                      getImages: (val) {
                                        images = val;
                                      },
                                      file: tradRecord,
                                      text: 'السجل التجاري',
                                    )),
                                SizedBox(
                                  height: h(15),
                                ),
                                SizedBox(
                                    height: h(60),
                                    child: UploadPhoto(
                                      index: 1,
                                      getImages: (val) {
                                        images = val;
                                      },
                                      file: workLicense,
                                      text: 'رخصة المهنة',
                                    )),
                                SizedBox(
                                  height: h(15),
                                ),
                                SizedBox(
                                    height: h(60),
                                    child: UploadPhoto(
                                      index: 2,
                                      getImages: (val) {
                                        images = val;
                                      },
                                      file: id,
                                      text: 'صورة هوية',
                                    )),
                                SizedBox(
                                  height: h(15),
                                ),
                                SizedBox(
                                    height: h(60),
                                    child: UploadPhoto(
                                      index: 3,
                                      getImages: (val) {
                                        images = val;
                                      },
                                      file: ministryLicense,
                                      text: 'موافقة وزارة الصحة',
                                    )),
                                SizedBox(
                                  height: h(15),
                                ),
                                SizedBox(
                                    height: h(60),
                                    child: UploadPhoto(
                                      index: 4,
                                      getImages: (val) {
                                        print('here');
                                        images = val;
                                        print(images.length);
                                      },
                                      file: tradRecord,
                                      text: 'مزاولة المهنة',
                                    )),
                                SizedBox(
                                  height: h(15),
                                ),
                                SizedBox(
                                  height: h(10),
                                ),
                                Container(
                                  width: w(300),
                                  child: text(
                                      text: "يمكن تحميل السجل التجاري لاحقا",
                                      color: Colors.yellow[800],
                                      fontsize: 14.sp,
                                      textAlign: TextAlign.end),
                                ),
                                SizedBox(
                                  height: h(20),
                                ),
                                SizedBox(
                                  height: h(15),
                                )
                              ],
                            )
                          : SizedBox(),
                    ],
                  )
                : Column(
                    children: [
                      inputContainer(
                          desc: 'الاسم',
                          controller: searchc,
                          hint: 'البحث عن الاسم المسجل',
                          widget: Icon(Icons.search),
                          validation: 'name',
                          value: (val) {
                            searched = val;
                          }),
                      SizedBox(
                        height: h(10),
                      ),
                      text(
                          text:
                              'سيتم ارسال طلب التسجيل الى مسؤول المستودع للمصادقة',
                          color: Colors.yellow[700],
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: h(10),
                      ),
                      Container(
                          height: h(250),
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: h(50),
                                      width: w(50),
                                      decoration: BoxDecoration(
                                          color: Colors.blue[100],
                                          shape: BoxShape.circle),
                                      child: Center(
                                          child: type == 'صيدلية'
                                              ? SvgPicture.asset(
                                                  'assets/images/phamacy.svg',
                                                  fit: BoxFit.contain,
                                                  height: h(30),
                                                  width: w(25),
                                                )
                                              : type == 'مستودع'
                                                  ? SvgPicture.asset(
                                                      'assets/images/store.svg',
                                                      fit: BoxFit.contain,
                                                      height: h(30),
                                                      width: w(25),
                                                    )
                                                  : SvgPicture.asset(
                                                      'assets/images/company.svg',
                                                      fit: BoxFit.contain,
                                                      height: h(30),
                                                      width: w(25),
                                                    )),
                                    ),
                                    text(
                                        text: 'شركة سختيان',
                                        color: Colors.black)
                                  ],
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 2,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 8,
                                    crossAxisCount: 3),
                          ))
                    ],
                  ),
            SizedBox(
              height: h(10),
            ),
            InkWell(
                onTap: () {
            if (pharmacey || store || company){
              if (newOne ||registered){
                if (series || branch){
                 if (   jobdesc !=null && name!=null && mobile !=null && pharmacylocationc!=null  && images.length==5 ){
                   registerPharmaRequestodel.name= name;
                   type == 'صيدلية'?
                   registerPharmaRequestodel.belongType = 'Pharmacy' : type =='شركة' ? 
                   registerPharmaRequestodel.belongType = 'Company' : registerPharmaRequestodel.belongType= "Warehouse";
                   registerPharmaRequestodel.existing = registered.toString();
                   registerPharmaRequestodel.name = name;
                   registerPharmaRequestodel.belongablePhone = mobile;
                   nav(context, PersonalInfo(registerPharmaRequestodel: registerPharmaRequestodel,));
                 }  
                }
                else {    Toast.show('الرجاء اكمال المعلومات اولا', context,gravity: 2);}  
              }
              else {
                Toast.show('الرجاء اكمال المعلومات اولا', context,gravity: 2);
              }
            }
            else {Toast.show('الرجاء اكمال المعلومات اولا', context,gravity: 2);}
                },
                // child: BlocConsumer<RegisterBloc, RegisterState>(
                //   listener: (context, state) {
                //   if (state is Error ){
                //     Toast.show(state.error, context);
                //   }

                //   if (state is GetRegisterState ){

                //     nav(context, PersonalInfo(images: images,registerPharmaRequestodel: registerPharmaRequestodel,));

                //   }

                //   },
                //   builder: (context, state) {
                //     if (state is Loading){
                //       return Center(child: CircularProgressIndicator());
                //     }
                  
                //     return 
                child:    appbutton(
                        AppColor.blue, " التالي", FontWeight.bold)
                  
                ),
            SizedBox(
              height: h(10),
            )
          ],
        )));
  }}

//   Widget pharmacycount(int count, String desc) {
//     return Column(
//       children: [
//         Container(
//           width: w(130),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                   child: text(
//                       text: desc,
//                       color: Colors.black,
//                       textAlign: TextAlign.start)),
//             ],
//           ),
//         ),
//         container(
//           hight: h(50),
//           width: w(150),
//           bordercolor: AppColor.grey,
//           borderRadius: 30,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     pharmacyCount++;
//                   });
//                 },
//                 child: container(
//                     hight: h(25),
//                     width: w(22),
//                     bordercolor: AppColor.grey,
//                     borderRadius: 50,
//                     child: Icon(Icons.add, size: w(15), color: Colors.black)),
//               ),
//               text(text: count.toString()),
//               GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       pharmacyCount != 1 ? pharmacyCount-- : pharmacyCount = 1;
//                     });
//                   },
//                   child: container(
//                       hight: h(25),
//                       width: w(22),
//                       bordercolor: AppColor.grey,
//                       borderRadius: 50,
//                       child: Icon(Icons.remove,
//                           size: w(15), color: Colors.black))),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
