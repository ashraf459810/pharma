

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/appWidget/basic_app_bar.dart';
import 'package:pharma/appWidget/drawer.dart';
import 'package:pharma/appWidget/from_to_date.dart';
import 'package:pharma/features/operations/data/models/stores_model.dart';
import 'package:pharma/features/operations/presentation/bloc/operations_bloc.dart';
import 'package:pharma/features/operations/presentation/pages/Operations.dart';
import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/CustomListView.dart';
import 'package:pharma/Widgets/Dropdown.dart';
import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/Widgets/Text.dart';
import 'package:pharma/appWidget/EmptyInputContainer.dart';

import 'package:pharma/appWidget/appButton.dart';
import 'package:pharma/appWidget/inputContainer.dart';
import 'package:pharma/appWidget/pharmacyMainBranchmobile.dart';
import 'package:toast/toast.dart';

import '../../../../injection.dart';

// ignore: must_be_immutable
class OperationType extends StatefulWidget {
  int operationnumber;
  OperationType({Key key, this.operationnumber}) : super(key: key);

  @override
  _OperationTypeState createState() => _OperationTypeState();
}

class _OperationTypeState extends State<OperationType> {
  int storeId;
  String storeName;
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
  TextEditingController companyc = TextEditingController();
  TextEditingController fromdatec = TextEditingController();
  TextEditingController todatec = TextEditingController();
  TextEditingController billnumc = TextEditingController();
  TextEditingController billdatec = TextEditingController();

  String restoreReason;
  List<String> list = ["نسخة فاتورة", "فتح حساب", "إسترجاع", "كشف حساب"];
  List<String> storeorcompanylist = ["company1", "company2"];
  List<String> restoreReasons = ["reason1", "reason2"];
  OperationsBloc operationsBloc= sl<OperationsBloc>();
  List<Warehouse> stores   =  [];
  @override
  void initState() {
     fromdate = DateTime.now().year.toString()+ '-'+DateTime.now().month.toString()+ "-"+DateTime.now().day.toString();
     todate =  DateTime.now().year.toString()+ '-'+DateTime.now().month.toString()+ "-"+DateTime.now().day.toString();
  operationsBloc.add(FetchStoresEvent());
    super.initState();
  }
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
      endDrawer: HomeDrawer(),
      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(top: 13.0),
          child: BasicAppBar(title : list[widget.operationnumber]),
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
                        fontsize: 14.sp,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center),
                  ),
                ),
              );
            }));
  }

  Widget accountStatment() {
    return Column(children: [
      emptyContainer(
                              desc: "اسم المستودع",
                              widget: Directionality(
                                textDirection: TextDirection.rtl,
                                child: DropDown(
                                  chosenvalue: storeName,
                                  list: stores,
                                  hint: "",
                                  onchanged: (val) {
                                    storeName = val.name;
                                         storeId = val.id;
                                  },
                                  getindex: (val) {

                               

                                  },
                                ),
                              )),
      SizedBox(
        height: h(50),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

   FromToDate(desc: "الى تاريخ",getDate: (val){
     todate = val;
   },),
      FromToDate(desc: 'من تاريخ',getDate: ( val){
        fromdate = val;
      },),
        ],
      ),
      SizedBox(
        height: h(150),
      ),
      BlocConsumer(
           bloc: operationsBloc,
        listener: (context, state) {
        if (state is AccountStatmentState){
          Toast.show('تم ارسال الطلب بنجاح', context);
        }


        if (state is Error){
          Toast.show(state.error, context,gravity: 2);
        }
        },
        builder: (context, state) {
          if (state is FetchStoresState){
            stores =state.storesModel.warehouses;
          }

          if (state is Loading){
            return Center(child: CircularProgressIndicator());
          }
          return GestureDetector(
            onTap: (){
              print('here');
              operationsBloc.add(AccountStatmentEvent(todate, fromdate, '1', '1'));
            },
            child: appbutton(AppColor.blue, "ارسال الطلب  ", FontWeight.bold));
        },
      )
    ]);
  }

  Widget copyForBill() {
    return Column(
      children: [
        emptyContainer(
            desc: "إسم المستودع أو الشركة",
            widget: Directionality(
              textDirection: TextDirection.rtl,
              child: DropDown(
                chosenvalue: storeOrCompanyname,
                list: storeorcompanylist,
                hint: "اختر اسم المستودع او الشركة",
                onchanged: (val) {
                  storeOrCompanyname = val;
                },
                getindex: (val) {},
              ),
            )),
        SizedBox(
          height: h(50),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            pharmacymainbranchphone("رقم الفاتورة", billnumc, "00000", (val) {
              fromdate = val;
            }),
            pharmacymainbranchphone("تاريخ الفاتورة", billdatec, "MM/DD/YYYY",
                (val) {
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
          widget: Directionality(
              textDirection: TextDirection.rtl,
              child: DropDown(
                chosenvalue: storeOrCompanyname,
                list: storeorcompanylist,
                hint: "اختر اسم المستودع او الشركة",
                onchanged: (val) {
                  storeOrCompanyname = val;
                },
                getindex: (val) {},
              ))),
      SizedBox(
        height: h(50),
      ),
      
      SizedBox(height: h(150)),
      appbutton(AppColor.blue, "ارسال الطلب  ", FontWeight.bold)
    ]);
  }

  Widget restore() {
    return Column(children: [
      emptyContainer(
          desc: "     إسم المستودع أو الشركة",
          widget: Directionality(
            textDirection: TextDirection.rtl,
            child: DropDown(
              chosenvalue: storeOrCompanyname,
              list: storeorcompanylist,
              hint: "اختر اسم المستودع او الشركة",
              onchanged: (val) {
                storeOrCompanyname = val;
                info[0] = storeOrCompanyname;
              },
              getindex: (val) {},
            ),
          )),
      SizedBox(
        height: h(17),
      ),
      inputContainer(
          controller: classificationc,
          desc: "الصنف",
          hint: "panadol advance",
          value: (val) {
            classification = val;
            info[1] = classification;
          },
          widget: SvgPicture.asset(
            "assets/images/PharmaServ(1).svg",
            height: h(25),
            width: w(25),
          )),
      SizedBox(
        height: h(17),
      ),
      inputContainer(
          validation: "number",
          controller: quantutyc,
          desc: "الكمية",
          hint: "0000",
          value: (val) {
            quantuty = val;
            info[2] = val;
          }),
      SizedBox(
        height: h(17),
      ),
      emptyContainer(
          desc: "سبب الإرجاع",
          widget: Directionality(
              textDirection: TextDirection.rtl,
              child: DropDown(
                chosenvalue: restoreReason,
                list: restoreReasons,
                hint: "إختر سبب الإرجاع",
                onchanged: (val) {
                  restoreReason = val;
                  info[3] = val;
                },
                getindex: (val) {},
              ))),
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
                                color: Colors.grey[200],
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
