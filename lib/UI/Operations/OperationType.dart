import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/CustomListView.dart';
import 'package:pharma/Widgets/Dropdown.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/EmptyInputContainer.dart';
import 'package:pharma/appWidget/HomePageAppbar.dart';
import 'package:pharma/appWidget/appButton.dart';
import 'package:pharma/appWidget/inputContainer.dart';
import 'package:pharma/appWidget/pharmacyMainBranchmobile.dart';

// ignore: must_be_immutable
class OperationType extends StatefulWidget {
  final String operationname;
  int operationnumber;
  OperationType({Key key, this.operationname, this.operationnumber})
      : super(key: key);

  @override
  _OperationTypeState createState() => _OperationTypeState();
}

class _OperationTypeState extends State<OperationType> {
  String fromdate;
  String todate;
  String companyname;
  String storeOrCompanyname;
  String restoreReason;
  List<String> list = ["نسخة عن فاتورة", "فتح حساب", "إسترجاع", "كشف حساب"];
  List<String> storeorcompanylist = ["company1", "company2"];
  List<String> restoreReasons = ["reason1", "reason2"];
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      copyForBill(),
      createAccount(),
      restore(),
      accountStatment(),
    ];
    return Scaffold(
      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(top: 13.0),
          child: HomePageAppBar(
            title: widget.operationname,
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
                        fontsize: 13,
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
            },
            getindex: (val) {},
          )),
      SizedBox(
        height: h(17),
      ),
      inputContainer(
          controller: TextEditingController(),
          desc: "                         الصنف",
          hint: "panadol advance",
          widget: SvgPicture.asset("assets/images/PharmaServ(1).svg")),
      SizedBox(
        height: h(17),
      ),
      inputContainer(
        validation: "number",
        controller: TextEditingController(),
        desc: "                       الكمية",
        hint: "0000",
      ),
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
            },
            getindex: (val) {},
          )),
      SizedBox(
        height: h(17),
      ),
      inputContainer(
        validation: "number",
        controller: TextEditingController(),
        desc: "رقم الفاتورة/رقم الباتش",
        hint: "435243",
      ),
      SizedBox(
        height: h(30),
      ),
      appbutton(AppColor.blue, "ارسال الطلب  ", FontWeight.bold),
      SizedBox(
        height: h(30),
      ),
    ]);
  }
}
