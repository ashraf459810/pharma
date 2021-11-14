import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/UI/Operations/Operations.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/CustomListView.dart';
import 'package:pharma/Widgets/Dropdown.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/EmptyInputContainer.dart';
import 'package:pharma/appWidget/HomePageAppbar.dart';
import 'package:pharma/appWidget/appButton.dart';
import 'package:pharma/appWidget/inputContainer.dart';
import 'package:pharma/appWidget/pharmacyMainBranchmobile.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class OperationType extends StatefulWidget {
  int operationnumber;
  OperationType({Key key, this.operationnumber}) : super(key: key);

  @override
  _OperationTypeState createState() => _OperationTypeState();
}

class _OperationTypeState extends State<OperationType> {
  String fromdate;
  String todate;
  String companyname;
  String storeOrCompanyname;
  String classification;
  String quantuty;
  String reasonforrestore;
  String restorebillnumber;
  List<String> info = ["1", "1", "1", "1", "1"];
  TextEditingController classificationc = TextEditingController();
  TextEditingController quantutyc = TextEditingController();
  TextEditingController restorebillnumberc = TextEditingController();

  String restoreReason;
  List<String> list = ["نسخة عن فاتورة", "فتح حساب", "إسترجاع", "كشف حساب"];
  List<String> storeorcompanylist = ["company1", "company2"];
  List<String> restoreReasons = ["reason1", "reason2"];
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      copyForBill(),
      createAccount(),
      GestureDetector(
          onTap: () {
            if (info.contains("1")) {
              Toast.show("please fill all the fields", context);
            } else
              restoreconfirmbottomsheet(storeOrCompanyname, classification,
                  quantuty, reasonforrestore, restorebillnumber);
          },
          child: restore()),
      accountStatment(),
    ];
    return Scaffold(
      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(top: 13.0),
          child: HomePageAppBar(
            title: "العمليات",
          ),
        ),
        preferredSize: Size.fromHeight(80),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            operationslist(list, widget.operationnumber),
            SizedBox(
              height: h(50),
            ),
            widgets[widget.operationnumber]
          ],
        ),
      ),
    );
  }

  Widget operationslist(List<String> list, int id) {
    return container(
        color: Colors.white,
        borderRadius: 40,
        width: w(400) - w(40),
        hight: h(80),
        child: customlistview(
            scroll: false,
            controller: ScrollController(),
            direction: "horizn",
            hight: h(70),
            width: MediaQuery.of(context).size.width - w(50),
            itemcount: 4,
            padding: 5,
            function: (context, index) {
              return GestureDetector(
                onTap: () {
                  widget.operationnumber = index;
                  setState(() {});
                },
                child: container(
                  width: w(80),
                  borderRadius: 30,
                  color: id == index ? AppColor.blue : Colors.transparent,
                  child: Center(
                    child: text(
                        text: list[index],
                        color: id == index ? Colors.white : AppColor.grey,
                        fontsize: 13.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }));
  }

  Widget accountStatment() {
    return Column(children: [
      inputContainer(
        desc: "      اسم الشركة",
        controller: TextEditingController(),
        hint: "مجموعة منير سختيان",
        ontap: (val) {
          companyname = val;
        },
      ),
      SizedBox(
        height: h(50),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          pharmacymainbranchphone(
              "الى تاريخ", TextEditingController(), "MM/DD/YYYY", (val) {
            fromdate = val;
          }),
          pharmacymainbranchphone(
              "من تاريخ", TextEditingController(), "MM/DD/YYYY", (val) {
            todate = val;
          }),
        ],
      ),
      SizedBox(
        height: h(150),
      ),
      appbutton(AppColor.blue, "ارسال الطلب  ", FontWeight.bold)
    ]);
  }

  Widget copyForBill() {
    return Column(
      children: [
        emptyContainer(
            desc: "إسم المستودع أو الشركة",
            widget: DropDown(
              chosenvalue: storeOrCompanyname,
              list: storeorcompanylist,
              hint: "اختر اسم المستودع او الشركة",
              onchanged: (val) {
                storeOrCompanyname = val;
              },
              getindex: (val) {},
            )),
        SizedBox(
          height: h(50),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            pharmacymainbranchphone(
                "رقم الفاتورة", TextEditingController(), "00000", (val) {
              fromdate = val;
            }),
            pharmacymainbranchphone(
                "تاريخ الفاتورة", TextEditingController(), "MM/DD/YYYY", (val) {
              todate = val;
            }),
          ],
        ),
        SizedBox(
          height: h(150),
        ),
        appbutton(AppColor.blue, "ارسال الطلب  ", FontWeight.bold)
      ],
    );
  }

  Widget createAccount() {
    return Column(children: [
      emptyContainer(
          desc: "إسم المستودع أو الشركة",
          widget: DropDown(
            chosenvalue: storeOrCompanyname,
            list: storeorcompanylist,
            hint: "اختر اسم المستودع او الشركة",
            onchanged: (val) {
              storeOrCompanyname = val;
            },
            getindex: (val) {},
          )),
      SizedBox(
        height: h(50),
      ),
      container(
          hight: h(70),
          width: w(343),
          borderRadius: 40,
          bordercolor: AppColor.grey,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                width: w(250),
                child: text(
                    text: "الرجاء ارفاق السجل التجاري",
                    color: AppColor.grey,
                    fontsize: 14)),
            Container(
                width: w(50),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 25,
                  color: AppColor.grey,
                )),
          ])),
      SizedBox(height: h(150)),
      appbutton(AppColor.blue, "ارسال الطلب  ", FontWeight.bold)
    ]);
  }

  Widget restore() {
    return Column(children: [
      emptyContainer(
          desc: "إسم المستودع أو الشركة",
          widget: DropDown(
            chosenvalue: storeOrCompanyname,
            list: storeorcompanylist,
            hint: "اختر اسم المستودع او الشركة",
            onchanged: (val) {
              storeOrCompanyname = val;
              info[0] = storeOrCompanyname;
            },
            getindex: (val) {},
          )),
      SizedBox(
        height: h(17),
      ),
      inputContainer(
          controller: classificationc,
          desc: "                         الصنف",
          hint: "panadol advance",
          value: (val) {
            classification = val;
            info[1] = classification;
          },
          widget: SvgPicture.asset(
            "assets/images/PharmaServ(1).svg",
          )),
      SizedBox(
        height: h(17),
      ),
      inputContainer(
          validation: "number",
          controller: quantutyc,
          desc: "                       الكمية",
          hint: "0000",
          value: (val) {
            quantuty = val;
            info[2] = val;
          }),
      SizedBox(
        height: h(17),
      ),
      emptyContainer(
          desc: "                سبب الإرجاع",
          widget: DropDown(
            chosenvalue: restoreReason,
            list: restoreReasons,
            hint: "إختر سبب الإرجاع",
            onchanged: (val) {
              restoreReason = val;
              info[3] = val;
            },
            getindex: (val) {},
          )),
      SizedBox(
        height: h(17),
      ),
      inputContainer(
          validation: "number",
          controller: restorebillnumberc,
          desc: "رقم الفاتورة/رقم الباتش",
          hint: "435243",
          value: (val) {
            restorebillnumber = val;
            info[4] = val;
          }),
      SizedBox(
        height: h(30),
      ),
      appbutton(AppColor.blue, "ارسال الطلب  ", FontWeight.bold),
      SizedBox(
        height: h(30),
      ),
    ]);
  }

  // ignore: missing_return
  Widget restoreconfirmbottomsheet(String storename, String classification,
      String quantity, String restorereason, String restorebillnumber) {
    List<String> infotitle = [
      "رقم الفاتورة",
      "سبب الإرجاع",
      "       الكمية",
      "       الصنف",
      "إسم المستودع",
    ];
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
                    text: "الرجاء التاكد من المعلومات",
                    color: AppColor.blue,
                    fontWeight: FontWeight.bold,
                    fontsize: 24.sp),
                SizedBox(
                  height: h(30),
                ),
                customlistview(
                    controller: ScrollController(),
                    direction: "vertical",
                    // hight: h(700),
                    itemcount: info.length,
                    scroll: false,
                    padding: 1,
                    function: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    width: w(110),
                                    child: Center(
                                        child: text(
                                            text: infotitle[index],
                                            color: Colors.black))),
                              ],
                            ),
                            SizedBox(
                              height: h(6),
                            ),
                            container(
                                hight: h(70),
                                width: w(343),
                                borderRadius: 40,
                                color: AppColor.grey,
                                child: text(
                                    text: info[index],
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontsize: 16.sp))
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: h(20),
                ),
                InkWell(
                    onTap: () {
                      navWithReplacement(
                          context,
                          Operations(
                            isrestore: true,
                          ));
                    },
                    child: appbutton(
                        AppColor.blue, "تاكيد الطلب", FontWeight.bold))
              ],
            ),
          );
        });
  }
}
