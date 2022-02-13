import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pharma/features/register/data/datasources/register_pharmacy_remote_data.dart';
import 'package:pharma/features/register/data/repositories/register_repostiry_imp.dart';
import 'package:pharma/features/register/domain/repositories/register_repository.dart';
import 'package:pharma/features/register/domain/usecases/register_use_case.dart';
import 'package:pharma/features/register/presentation/bloc/register_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'Core/network/network_info.dart';
import 'Core/remote_data_function/http_methods.dart';


final sl = GetIt.instance;

Future init() async {
  // blocs 
  sl.registerFactory(
    () => RegisterBloc(
      sl(),
    ),
  );

   // Use cases
  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCaseImp(
      sl(),
    ),
  );

// Repository

  sl.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImp(
      sl(),
      sl(),
    ),

  );  

   // Data sources
  sl.registerLazySingleton<RegisterPharmacyRemoteData>(
    () => RegisterPharmacyRemoteDataImp(sl(), sl()),
  );
  //! External
  // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<NetworkFunctions>(
    () => NetworkFunctionsImp(),
  );
  sl.registerLazySingleton<NetworkInf>(
    () => NetworkInfImpl(),
  );
  sl.registerLazySingleton(() => InternetConnectionChecker());




}
