import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/features/register/data/models/register_pharma_request_model.dart';

import 'package:pharma/Widgets/Dropdown.dart';

import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/EmptyInputContainer.dart';
import 'package:pharma/appWidget/RegisterAppBar.dart';

import 'package:pharma/appWidget/appButton.dart';

import 'package:pharma/appWidget/inputContainer.dart';
import 'package:pharma/features/register/data/models/roles_model.dart';
import 'package:pharma/features/register/presentation/bloc/register_bloc.dart';
import 'package:pharma/features/register/presentation/pages/PersonalInfo.dart';
import 'package:pharma/features/register/presentation/widgets/map.dart';

import 'package:pharma/features/register/presentation/widgets/tow_option_filter.dart';
import 'package:pharma/features/register/presentation/widgets/type_filter.dart';
import 'package:pharma/features/register/presentation/widgets/upload_photo.dart';
import 'package:toast/toast.dart';

import '../../../../injection.dart';

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterPharmaRequestodel registerPharmaRequestodel =
      RegisterPharmaRequestodel();
  String hint = '';
  bool pharmacey;
  bool store;
  bool company;
  bool newOne;
  int accountRoleId;
  bool registered = false;
  String searched;
  List<String> list = ["مالك الصيدلية", "مسؤول الصيدلية ", "صيدلاني"];
  String jobdesc;
  String pramacyname;
  String name;
  TextEditingController searchc = TextEditingController();
  TextEditingController pharmacynamec = TextEditingController();
   TextEditingController branchc = TextEditingController();
  TextEditingController pharmacymobilec = TextEditingController();
  TextEditingController mainbranchmobilec = TextEditingController();
  TextEditingController pharmacylocationc = TextEditingController();
  String mobile;
  String mainbranchnumber;
  int pharmacyCount = 1;
  String iscolored = "1";
  String location;
  var type;
  String registerOrNew;
  String oneBranchOrMany;
  String branch ;
  XFile tradRecord;
  XFile workLicense;
  XFile mozawala;
  XFile id;
  XFile ministryLicense;
  List<XFile> images = [
    XFile('path'),
    XFile('path'),
    XFile('path'),
    XFile('path'),
    XFile('path')
  ];
  RegisterBloc registerBloc = sl<RegisterBloc>();
  List<Roles> pharmaroles = [];
  List<Roles> storeRoles = [];
  List<Roles> companyRoles = [];

  @override
  void initState() {
    log('init');
    registerBloc.add(FetchRolesEvent());
    pharmacey = false;
    store = false;
    company = false;
    newOne = false;
    registered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pharmaroles = [];
    storeRoles = [];
    companyRoles = [];
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
            BlocListener(
              bloc: registerBloc,
              listener: (context, state) {
                

             
                                      
                                                    if (state is Error){
                                      Toast.show(state.error, context,gravity: 2);
                                    
                                                    }
                                    
                                   

              },
              child: SizedBox(
                height: h(20),
              ),
            ),
            SizedBox(
                height: h(75),
                child: TypeFilter(
                    company: company,
                    pharmacey: pharmacey,
                    store: store,
                    getType: (val) {
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
                      setState(() {});
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

                        registerOrNew = val;
                        if (val == 'جديد') {
                          newOne = true;
                          registered = false;
                        } else {
                          newOne = false;
                          registered = true;
                        }
                        setState(() {});
                      },
                    ))
                : SizedBox(),
            SizedBox(
              height: h(20),
            ),
        
                Column(
                    children: [
                     
                   
                
                      (pharmacey  || store || company) &&
                              (newOne)
                          ? Column(
                              children: [
                                BlocBuilder(
                                  bloc: registerBloc,
                                  builder: (context, state) {
                                    if (state is Loading) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    if (state is FetchRolesState) {
                                      for (var i = 0;
                                          i < state.rolesModel.response.length;
                                          i++) {
                                        if (state
                                            .rolesModel.response[i].roleType
                                            .contains('Pharmacy')) {
                                          pharmaroles.add(
                                              state.rolesModel.response[i]);
                                        } else if (state
                                            .rolesModel.response[i].roleType
                                            .contains('Warehouse')) {
                                          storeRoles.add(
                                              state.rolesModel.response[i]);
                                        } else if (state
                                            .rolesModel.response[i].roleType
                                            .contains('Company')) {
                                          companyRoles.add(
                                              state.rolesModel.response[i]);
                                        }
                                      }
                                    }

                                    return emptyContainer(
                                        desc: "الوصف الوظيفي",
                                        widget: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: DropDown(
                                            chosenvalue: jobdesc,
                                            list: pharmacey
                                                ? pharmaroles
                                                : store
                                                    ? storeRoles
                                                    : companyRoles,
                                            hint: hint,
                                            onchanged: (val) {
                                              jobdesc = val.name;
                                              accountRoleId = val.id;
                                            },
                                            getindex: (val) {},
                                          ),
                                        ));
                                  },
                                 
                                ),
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
                                    desc: "الفرع",
                                    controller: branchc,
                                    hint: "فرع الشفاء",
                                    value: (val) {
                                      branch = val;
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
                                          InkWell(
                                            onTap:  () {
                                            
                                        nav(context, MyLocation(function: (value){
                                       setState(() {
                                          location = value.latitude.toString() + ","+ value.longitude.toString();
                                       });
                                  
                                  
                                   log(location)
                                  ;
                                          
                                        },));},
                                            child: emptyContainer(
                                                desc: "الموقع",
                                                // hint: "شارع الفيحاء",
                                              
                                                widget: Row(
                                                  children: [
                                                    SizedBox(width: w(20),),
                                                   Row(
                                                     children: [
                                  
                                                       Icon(
                                                        location == null ?   Icons.pin_drop : Icons.check,
                                                          color: location == null ?  AppColor.grey : Colors.green,
                                                          size: w(25),
                                                        ),
                                                                             Container(alignment: Alignment.centerRight,
                                                                            
                                                                               width: w(290),
                                                                               child: text(text:       location != null ?  "تم تحديد الموقع":"",fontsize: 16.sp)),
                                                     ],
                                                   ),
                                                  ],
                                                ),
                                                                              ),
                                          ),
                                          SizedBox(
                                            height: h(17),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: w(30)),
                                                child: Container(
                                                    width: w(150),
                                                    child: text(
                                                        text:
                                                            "الرجاءارفاق الوثائق التالية",
                                                        color: Colors.black,
                                                        textAlign:
                                                            TextAlign.end)),
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
                                                  tradRecord = val;

                                                  images[0] = val;
                                                },
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
                                                  workLicense = val;
                                                  images[1] = val;
                                                },
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
                                                  id = val;
                                                  images[2] = val;
                                                },
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
                                                  ministryLicense = val;
                                                  images[3] = val;
                                                },
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
                                                  mozawala = val;

                                                  images[4] = val;
                                                },
                                                text: 'مزاولة المهنة',
                                              )),
                                          SizedBox(
                                            height: h(15),
                                          ),
                                        ],
                                      )
                                    : SizedBox(),
                                // SizedBox(
                                //   height: h(10),
                                // ),
                                // SizedBox(
                                //   height: h(20),
                                // ),
                                SizedBox(
                                  height: h(15),
                                )
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
                          height: h(270),
                          child: GridView.builder(
                            
                            scrollDirection: Axis.vertical,
                            itemCount: 5,
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
                                    childAspectRatio: 1.4,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 8,
                                    crossAxisCount: 3),
                          ))
                    ],
                  ),
            // SizedBox(
            //   height: h(10),
            // ),
            InkWell(
                onTap: () {
                  if (pharmacey && newOne || store && !registered) {
                    if ( store) {
                      if (jobdesc != null &&
                          name != null &&
                          mobile != null &&
                          location != null &&
                          ministryLicense != null &&
                          id != null &&
                          tradRecord != null &&
                          workLicense != null &&
                          mozawala != null) {
                        registerPharmaRequestodel.belongableName = name ;
                        type == 'صيدلية'
                            ? registerPharmaRequestodel.belongType = 'Pharmacy'
                            : type == 'شركة'
                                ? registerPharmaRequestodel.belongType =
                                    'Company'
                                : registerPharmaRequestodel.belongType =
                                    "Warehouse";
                        registerPharmaRequestodel.existing =
                            registered.toString();
                        registerPharmaRequestodel.belongableLocation = location;
                        registerPharmaRequestodel.belongablePhone = mobile;
                        registerPharmaRequestodel.setAccountRolesId =
                            accountRoleId.toString();

                        nav(
                            context,
                            PersonalInfo(
                              registerPharmaRequestodel:
                                  registerPharmaRequestodel,
                              images: images,
                            ));
                      } else {
                        Toast.show('الرجاء اكمال المعلومات اولا', context,
                            gravity: 1);
                      }
                    } else {
                      Toast.show('الرجاء اكمال المعلومات اولا', context,
                          gravity: 1);
                    }
                  } else if (pharmacey && registered ||
                      (store && registered || company && registered)) {
                    if (searched != null) {
                      nav(
                          context,
                          PersonalInfo(
                            registerPharmaRequestodel:
                                registerPharmaRequestodel,
                          ));
                    }
                  } else if (company && newOne) {
                    if (jobdesc != null && name != null && mobile != null) {
                      nav(
                          context,
                          PersonalInfo(
                            registerPharmaRequestodel:
                                registerPharmaRequestodel,
                            images: images,
                          ));
                    } else {
                      Toast.show('الرجاء اكمال المعلومات اولا', context,
                          gravity: 1);
                    }
                  }
               
                  
                   else {
                    Toast.show('الرجاء اكمال المعلومات اولا', context,
                        gravity: 1);
                  }
                },
                child: appbutton(AppColor.blue, " التالي", FontWeight.bold)),
            SizedBox(
              height: h(10),
            )])])));
          
        
  }
}

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
