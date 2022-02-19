import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pharma/Core/Consts.dart';

import 'package:pharma/Widgets/Nav.dart';
import 'package:pharma/features/homePage/HomePage.dart';
import 'package:pharma/features/login/presentation/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../injection.dart';



class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
   Timer(Duration(seconds: 2), (){
     var response =hasToken();
     if (!response){
     navWithReplacement(context, SignIn());}
     else {
       navWithReplacement(context, HomePage(index: 0,));
     }
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Image.asset('assets/images/logo.png'),) ,
    );
  }
  bool hasToken (){
    SharedPreferences sharedPreferences = sl<SharedPreferences> ();

    String hasToken = sharedPreferences.getString(Con.token) ?? 'false';
    log(hasToken);
   if (hasToken !='false'){
     return true;
   }
   else {
     return false;
   }
  }
}