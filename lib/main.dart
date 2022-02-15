import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'App/app.dart';
import 'injection.dart' as di;

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  // before the runApp() call
  WidgetsFlutterBinding.ensureInitialized();
   await di.init();


  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}



 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}