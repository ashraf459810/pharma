import 'dart:async';

import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/App/app.dart';

import 'package:pharma/Widgets/Container.dart';
import 'package:pharma/Widgets/Text.dart';

class OrderMedChat extends StatefulWidget {
  OrderMedChat({Key key}) : super(key: key);

  @override
  _OrderMedChatState createState() => _OrderMedChatState();
}

class _OrderMedChatState extends State<OrderMedChat> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  final ChatUser user = ChatUser(
    name: "Fayeed",
    uid: "123456789",
    avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
  );

  final ChatUser otherUser = ChatUser(
    name: "Mrfatty",
    uid: "25649654",
  );

  List<ChatMessage> messages = <ChatMessage>[];
  var m = <ChatMessage>[];

  var i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Padding(
          padding: EdgeInsets.only(left: w(80.0)),
          child: text(
              text: "صيدلية الشفاء",
              color: Colors.black,
              fontsize: 20.sp,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center),
        ),
        foregroundColor: Colors.grey[50],
        backgroundColor: Colors.grey[50],
        elevation: 0,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: h(20),
          ),
          typeWidget(),
          Container(
            color: Colors.blueGrey[50],
            height: h(520),
            child: DashChat(
                key: _chatViewKey,
                inverted: false,
                onSend: (message) {
                  messages.add(message);
                },
                sendOnEnter: true,
                textInputAction: TextInputAction.send,
                user: user,
                inputDecoration:
                    InputDecoration.collapsed(hintText: "Add message here..."),
                dateFormat: DateFormat('yyyy-MMM-dd'),
                timeFormat: DateFormat('HH:mm'),
                messages: messages,
                showUserAvatar: false,
                showAvatarForEveryMessage: false,
                scrollToBottom: false,
                onPressAvatar: (ChatUser user) {
                  print("OnPressAvatar: ${user.name}");
                },
                onLongPressAvatar: (ChatUser user) {
                  print("OnLongPressAvatar: ${user.name}");
                },
                inputMaxLines: 5,
                messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                alwaysShowSend: true,
                inputTextStyle: TextStyle(fontSize: 16.0),
                inputContainerStyle: BoxDecoration(
                  border: Border.all(width: 0.0),
                  color: Colors.white,
                ),
                onQuickReply: (Reply reply) {
                  setState(() {
                    messages.add(ChatMessage(
                        text: reply.value,
                        createdAt: DateTime.now(),
                        user: user));

                    messages = [...messages];
                  });

                  Timer(Duration(milliseconds: 300), () {
                    _chatViewKey.currentState.scrollController
                      ..animateTo(
                        _chatViewKey.currentState.scrollController.position
                            .maxScrollExtent,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );

                    if (i == 0) {
                      Timer(Duration(milliseconds: 600), () {});
                    }
                  });
                }),
          )
        ],
      ),
    );
  }

  Widget typeWidget() {
    return container(
        hight: h(150),
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
                typeSpecifications(h(30), w(70), "اضافي ٢٠+٢٠٠"),
                typeSpecifications(h(30), w(100), "تاريخ الانتهاء ١٢/١٢/٢٠٢٢"),
              ],
            ),
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
}
