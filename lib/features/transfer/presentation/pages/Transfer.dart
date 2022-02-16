import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/UI/PharmaDetails/PharmaDetails.dart';

import 'package:pharma/UI/Search/Search.dart';
import 'package:pharma/UI/TypeDetails/TypeDetails.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/CustomListView.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/Widgets/TextForm.dart';
import 'package:pharma/appWidget/EmptyInputContainer.dart';

import 'package:pharma/appWidget/appButton.dart';
import 'package:pharma/appWidget/inputContainer.dart';


class Transfer extends StatefulWidget {
  Transfer({Key key}) : super(key: key);

  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
    List<Type> images = [
    Type("1", "none"),
    Type("2", "none"),
    Type("3", "none"),
    Type("4", "none"),
    Type("5", "none"),
    Type("6", "none"),
    Type("7", "none"),
    Type("8", "none"),
    Type("none", "اخرى"),
    Type("none", "الكل")
  ];
  int clicked;
    
    
  String type;
  TextEditingController typec = TextEditingController();
  String quantity;
  TextEditingController quantityc = TextEditingController();
  String extra;
  TextEditingController extrac = TextEditingController();
  String focus;
  TextEditingController focusc = TextEditingController();
  String expire;
  TextEditingController expirec = TextEditingController();
  XFile imageFile;
  dynamic pickImageError;
  int index= 0;

  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
  
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColor.background,
   
          appBar: PreferredSize(
            
            child: Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: AppBar(
                
                     bottom:  TabBar(
                       onTap: (value) {
                        log(value.toString());
                         index = value;
setState(() {
  
});
                          

                       } ,
unselectedLabelColor: Colors.black,
                       labelColor: Colors.blue,
                       indicatorColor: AppColor.blue,
                       
            tabs: [

              Tab(child: text( text: 'اصنافي',color: Colors.black,fontWeight: FontWeight.bold,fontsize: 18.sp)),
                   
              Tab( child:  text( text: 'سجل طلباتي',color: Colors.black,fontWeight: FontWeight.bold,fontsize: 18.sp,),),
                       Tab( child : text( text: 'الاصناف',color: Colors.black,fontWeight: FontWeight.bold,fontsize: 18.sp)),
            ],),
              backgroundColor:  AppColor.background,
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
                title: text(text: 'تحويل',fontsize: 20.sp,fontWeight: FontWeight.bold,color: Colors.black),centerTitle: true,)
            ),
            preferredSize: Size.fromHeight(120),
          ),
          body: ListView(
            children: [
              SizedBox(height: h(20),),
              Column(
                children: [
                  // SizedBox(
                  //   height: h(20),
                  // ),
                  // GestureDetector(
                      // onTap: () {
                      //   addtype();
                      // },
                      // child: container(
                      //   color: AppColor.blue,
                      //   hight: h(60),
                      //   width: w(350),
                      //   borderRadius: 30,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       text(
                      //           text: "اضافة صنف",
                      //           color: Colors.white,
                      //           fontsize: 20.sp),
                      //       SizedBox(
                      //         width: w(10),
                      //       ),
                      //       Icon(
                      //         Icons.add,
                      //         color: Colors.white,
                      //         size: w(20),
                      //       )
                      //     ],
                      //   ),
                      // )),
                  
                  SizedBox(
                    height: h(20),
                  ),
                  InkWell(
                    onTap: () {
                      nav(context, Search());
                    },
                    child: container(
                        color: Colors.white,
                        hight: h(60),
                        width: w(350),
                        borderRadius: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              "assets/images/PharmaServ(1).svg",
                              width: w(25),
                              height: h(25),
                            ),
                            text(
                                text: "بحث عن صيدلية او صنف",
                                color: AppColor.grey,
                                fontsize: 20.sp),
                            SizedBox(
                              width: w(10),
                            ),
                          ],
                        )),
                  ),
             index ==2?     Column(
                    children: [
                      SizedBox(
                        height: h(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: w(90),
                              child: text(
                                  text: "صيدليات",
                                  fontsize: 20.sp,
                                  textAlign: TextAlign.center)),
                          SizedBox(
                            height: h(20),
                          ),
                        ],
                      ),
                      customlistview(
                          controller: ScrollController(),
                          direction: "horizon",
                          scroll: true,
                          hight: h(120),
                          itemcount: 10,
                          padding: 10,
                          width: MediaQuery.of(context).size.width,
                          function: (context, index) {
                            return InkWell(
                              onTap: () {
                                nav(context, PharmaDetails());
                              },
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: h(20)),
                                child: Container(
                                  color:  AppColor.background,
                                      child: Column(
                                        children: [
                                          Container(
                                    
                                            height: h(70),
                                            width: w(50),
                                            decoration: BoxDecoration(
                                                color: Colors.blue[100],
                                                shape: BoxShape.circle),
                                            child: Center(
                                                child: 
                                                    SvgPicture.asset(
                                                        'assets/images/phamacy.svg',
                                                        fit: BoxFit.contain,
                                                        height: h(30),
                                                        width: w(25),
                                                      )
                                                 ),
                                          ),
                                          text(
                                              text: 'شركة سختيان',
                                              color: Colors.black)
                                        ],
                                      ),
                                    ),
                              )
                            );
                          }),
                    ],
                  ):SizedBox(),

                  SizedBox(
                    height: h(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: w(60),
                          child: text(text: "الاصناف", fontsize: 20.sp)),
                      SizedBox(
                        height: h(20),
                      ),
                    ],
                  ),
                     container(
              color: Colors.white,
              borderRadius: 30,
              hight: h(70),
              width: MediaQuery.of(context).size.width - w(20),
              child: customlistview(
                  controller: ScrollController(),
                  direction: "horizon",
                  hight: h(60),
                  width: MediaQuery.of(context).size.width - w(20),
                  itemcount: images.length,
                  padding: 5,
                  scroll: true,
                  function: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: w(10)),
                      child: GestureDetector(
                          onTap: () {
                            clicked = index;
                            setState(() {});
                          },
                          child: clicked != index
                              ? types(images, index)
                              : Container(
                                  height: h(60),
                                  width: w(60),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.blue,
                                  ),
                                  child: types(images, index))),
                    );
                  })),
                  customlistview(
                      controller: ScrollController(),
                      direction: "vertical",
                      // hight: h(370),
                      itemcount: 10,
                      scroll: false,
                      padding: 10,
                      width: MediaQuery.of(context).size.width,
                      function: (context, index) {
                        return InkWell(
                            onTap: () {
                              nav(context, TypeDetails());
                            },
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: h(10)),
                              child: typeWidget(),
                            ));
                      })
                ],
              )
            ],
          )),
    );
  }

  Widget typeWidget() {
    return container(
        hight: h(130),
        width: w(375),
        color: Colors.white,
        borderRadius: 10,
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: w(70),
                        child: text(
                            textAlign: TextAlign.end,
                            text: "صيدلية الشفاء",
                            fontsize: 12.sp),
                      ),
                      Container(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: h(100),
                            maxWidth: w(250),
                          ),
                          child: text(
                              textAlign: TextAlign.end,
                              text:
                                  "Panadol Advance with Optizorb Formulation 48 Tablets",
                              fontsize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      container(
                        hight: h(80),
                        width: w(80),
                        borderRadius: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/images/med.png", fit: BoxFit.contain,
                            height: h(80), width: w(80),
                            // height: h(300),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                typeSpecifications(h(30), w(70), "500 ml"),
                typeSpecifications(h(30), w(70), "الكمية ٤٠٠"),
                typeSpecifications(h(30), w(90), "اضافي ٢٠+٢٠٠"),
                typeSpecifications(h(30), w(100), "تاريخ الانتهاء ١٢/١٢/٢٠٢٢"),
              ],
            )
          ],
        ));
  }

  Widget typeSpecifications(double hight, double width, String textvalue) {
    return (container(
        borderRadius: 20,
        hight: hight,
        width: width,
        child:
            Center(child: text(text: textvalue, textAlign: TextAlign.center)),
        color: Colors.grey[100]));
  }

   addtype() {
    showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              children: [
                SizedBox(
                  height: h(30),
                ),
                text(
                    text: "عرض صنف التحويل",
                    color: AppColor.blue,
                    fontWeight: FontWeight.bold,
                    fontsize: 24.sp,
                    textAlign: TextAlign.center),
                SizedBox(
                  height: h(30),
                ),
                inputContainer(
                  desc: "الصنف",
                  controller: typec,
                  hint: "panadol extra",
                  value: (val) {
                    type = val;
                  },
                ),
                SizedBox(
                  height: h(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    emptyContainer(
                        textwidth: w(100),
                        hight: h(50),
                        width: w(120),
                        desc: "الكمية",
                        widget: Directionality(
                            textDirection: TextDirection.rtl,
                            child: textform(
                                padding: EdgeInsets.only(right: w(20)),
                                controller: quantityc,
                                validation: "number",
                                hint: "٢٠٠",
                                hintsize: 16.sp,
                                hintColor: AppColor.grey,
                                function: (val) {
                                  quantity = val;
                                }))),
                    emptyContainer(
                        textwidth: w(100),
                        hight: h(50),
                        width: w(120),
                        desc: "اضافي",
                        widget: Directionality(
                          textDirection: TextDirection.rtl,
                          child: textform(
                              padding: EdgeInsets.only(right: w(20)),
                              controller: extrac,
                              hint: "٢٠ +٢",
                              hintsize: 16.sp,
                              hintColor: AppColor.grey,
                              function: (val) {
                                extra = val;
                              }),
                        ))
                  ],
                ),
                SizedBox(
                  height: h(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    emptyContainer(
                        textwidth: w(100),
                        hight: h(50),
                        width: w(120),
                        desc: "تاريخ الانتهاء",
                        widget: Directionality(
                            textDirection: TextDirection.rtl,
                            child: textform(
                                padding: EdgeInsets.only(right: w(20)),
                                controller: expirec,
                                hint: "dd/mm/yyyy",
                                hintsize: 16.sp,
                                hintColor: AppColor.grey,
                                function: (val) {
                                  expire = val;
                                }))),
                    emptyContainer(
                        textwidth: w(100),
                        hight: h(50),
                        width: w(120),
                        desc: "تركيز",
                        widget: Directionality(
                            textDirection: TextDirection.rtl,
                            child: textform(
                                padding: EdgeInsets.only(right: w(20)),
                                controller: focusc,
                                hint: "500 ml",
                                hintsize: 16.sp,
                                hintColor: AppColor.grey,
                                function: (val) {
                                  focus = val;
                                })))
                  ],
                ),
                SizedBox(
                  height: h(20),
                ),
                inputContainer(
                    desc: "موقع الصيدلية",
                    hint: "شارع الفيحاء",
                    controller: TextEditingController(text: ""),
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
                                  text: "السجل التجاري",
                                  color: Colors.black,
                                  textAlign: TextAlign.end)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h(6),
                    ),
                    GestureDetector(
                      onTap: () {
                        _onImageButtonPressed(ImageSource.gallery);
                      },
                      child: container(
                          hight: h(70),
                          width: w(343),
                          borderRadius: 40,
                          bordercolor: AppColor.grey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: w(75),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: w(25),
                                    color: AppColor.grey,
                                  )),
                              Container(
                                  width: w(150),
                                  child: text(
                                      text: " الرجاء ارفاق السجل التجاري",
                                      color: AppColor.grey,
                                      fontsize: 14.sp,
                                      textAlign: TextAlign.start)),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: h(10),
                    ),
                    SizedBox(
                      height: h(20),
                    ),
                    SizedBox(
                      height: h(15),
                    )
                  ],
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: appbutton(AppColor.blue, "اضافة", FontWeight.bold))
              ],
            ),
          );
        });
  }

  void _onImageButtonPressed(ImageSource source, ) async {
    // await _displayPickImageDialog(context,
    //     (double maxWidth, double maxHeight, int quality) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
        // maxWidth: maxWidth,
        // maxHeight: maxHeight,
        // imageQuality: ,
      );
      setState(() {
        imageFile = pickedFile;
      });
    } catch (e) {
      setState(() {
        pickImageError = e;
      });
    }
  }
}
