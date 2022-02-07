import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/UI/Personal_Info/PersonalInfo.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Dropdown.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/EmptyInputContainer.dart';
import 'package:pharma/appWidget/RegisterAppBar.dart';

import 'package:pharma/appWidget/appButton.dart';

import 'package:pharma/appWidget/inputContainer.dart';

import 'package:pharma/appWidget/pharmacyMainBranchmobile.dart';
import 'package:pharma/features/register/presentation/widgets/tow_option_filter.dart';
import 'package:pharma/features/register/presentation/widgets/type_filter.dart';
import 'package:pharma/features/register/presentation/widgets/upload_photo.dart';

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool pharmacey ;
  bool store ;
  bool company;
  bool newFarmacy ;
  bool registeredFarmacy ;

  List<String> list = ["مالك الصيدلية", "مسؤول الصيدلية ", "صيدلاني"];
  String jobdesc;
  String pramacyname;
  String pharmacyname;
  TextEditingController pharmacynamec = TextEditingController();
  TextEditingController pharmacymobilec = TextEditingController();
  TextEditingController mainbranchmobilec = TextEditingController();
  TextEditingController pharmacylocationc = TextEditingController();
  String pharmacymobile;
  String mainbranchnumber;
  int pharmacyCount = 1;
  String iscolored = "1";

 String type;
 String registerOrNew;
 String oneBranchOrMany;
 bool option3 = false; 
 bool option4 = false;
 XFile tradRecord;
 XFile workLicense;
 XFile id;
 XFile ministryLicense;
  final ImagePicker _picker = ImagePicker();

@override
  void initState() {
       pharmacey  =false;
   store = false;
   company= false;
   newFarmacy = false;
   registeredFarmacy = false;
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
               child:  TypeFilter(company: company,pharmacey: pharmacey,store: store,getType:  (val){

            
           
  
setState(() {
       type = val;
       if (type =='صيدلية'){
         pharmacey = true;
         company = false;
         store = false;

       }
       else if (type== 'شركة'){
         company = true;
         store = false;
         pharmacey = false;
       }
       else {store = true;
       pharmacey = false;
       company = false;
       }
  
});
               })),
          SizedBox(height: h(20),),
  type !=null?    SizedBox(
          height: h(70),
          child: TwoOptionFilter(registeredFarmacy: newFarmacy,newFarmacy: registeredFarmacy,option1: 'جديد',option2: 'مسجل',getOption: (val){
           
           log(val);
             
             setState(() {
               registerOrNew = val;  
               if (val == 'جديد'){
                 newFarmacy = true;
                 registeredFarmacy = false;
               }
               else {
                  newFarmacy = false;
                 registeredFarmacy = true;
               }
             });
         
          }, )):SizedBox(),

                 SizedBox(height: h(20),),
      registerOrNew !=null ?  SizedBox(
          height: h(70),
          child: TwoOptionFilter(registeredFarmacy: option3,newFarmacy: option4,option1: 'سلسلة',option2: 'فرع',getOption: (val){
            oneBranchOrMany = val;
            
          }, )):SizedBox(),
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
                  desc: "اسم الصيدلية",
                  controller: pharmacynamec,
                  hint: "صيدلية الشفاء",
                  value: (val) {
                    pramacyname = val;
                  }),
              SizedBox(
                height: h(17),
              ),
              pharmacey
                  ? inputContainer(
                      desc: "رقم هاتف الصيدلية",
                      controller: pharmacymobilec,
                      validation: "number",
                      hint: "07901231231",
                      value: (val) {
                        pharmacymobile = val;
                      })
                  : Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // height: h(90),
                            child: pharmacymainbranchphone("هاتف الفرع الرئيسي",
                                mainbranchmobilec, "079123123", (val) {
                              mainbranchnumber = val;
                            }),
                          ),
                          pharmacycount(pharmacyCount, "عدد الصيدليات")
                        ],
                      ),
                    ),
              SizedBox(
                height: h(14),
              ),
              inputContainer(
                  desc: "موقع الصيدلية",
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: w(30)),
                        child: Container(
                            width: w(150),
                            child: text(
                                text: "الرجاءارفاق الوثائق التالية",
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
                  child: UploadPhoto(file: tradRecord,text: 'السجل التجاري',)),
                             SizedBox(
                    height: h(15),
                  ),
                SizedBox(
                  height: h(60),
                  child: UploadPhoto(file: workLicense,text: 'رخصة المهنة',)),
                                 SizedBox(
                    height: h(15),
                  ),
                          SizedBox(
                  height: h(60),
                  child: UploadPhoto(file: id,text: 'صورة هوية',)),
                                 SizedBox(
                    height: h(15),
                  ),
                           SizedBox(
                  height: h(60),
                  child: UploadPhoto(file: ministryLicense,text: 'موافقة وزارة الصحة',)),
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
                  InkWell(
                      onTap: () {
                        nav(context, PersonalInfo());
                      },
                      child:
                          appbutton(AppColor.blue, "التالي", FontWeight.bold)),
                  SizedBox(
                    height: h(15),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Widget pharmacycount(int count, String desc) {
    return Column(
      children: [
        Container(
          width: w(130),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  child: text(
                      text: desc,
                      color: Colors.black,
                      textAlign: TextAlign.start)),
            ],
          ),
        ),
        container(
          hight: h(50),
          width: w(150),
          bordercolor: AppColor.grey,
          borderRadius: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    pharmacyCount++;
                  });
                },
                child: container(
                    hight: h(25),
                    width: w(22),
                    bordercolor: AppColor.grey,
                    borderRadius: 50,
                    child: Icon(Icons.add, size: w(15), color: Colors.black)),
              ),
              text(text: count.toString()),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pharmacyCount != 1 ? pharmacyCount-- : pharmacyCount = 1;
                    });
                  },
                  child: container(
                      hight: h(25),
                      width: w(22),
                      bordercolor: AppColor.grey,
                      borderRadius: 50,
                      child: Icon(Icons.remove,
                          size: w(15), color: Colors.black))),
            ],
          ),
        ),
      ],
    );
  }


}
