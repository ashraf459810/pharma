import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'App/app.dart';
import 'injection.dart' as di;

Future<void> main() async {
  // before the runApp() call

   await di.init();
  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}
