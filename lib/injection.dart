import 'package:get_it/get_it.dart';

import 'Data/HTTP_Helper/IHttp_Helper.dart';
import 'Data/Prefs_Helper/IPrefs_Helper.dart';
import 'Data/Repository/IRepository.dart';

final sl = GetIt.instance;

Future iniGetIt() async {
  //data

  sl.registerLazySingleton<IprefsHelper>(() => IprefsHelper());
  sl.registerLazySingleton<IHttpHlper>(() => IHttpHlper());
  sl.registerLazySingleton<IRepository>(() => IRepository(sl(), sl()));

  /// AppBloc
}
