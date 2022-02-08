import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/features/login/presentation/pages/login.dart';



class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
   Timer(Duration(seconds: 2), (){
     nav(context, SignIn());
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Image.asset('assets/images/logo.png'),) ,
    );
  }
}