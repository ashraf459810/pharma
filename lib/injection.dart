import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pharma/Core/user/data/local_data/user_local_data.dart';
import 'package:pharma/Core/user/data/repository/user_repository_impl.dart';
import 'package:pharma/Core/user/domain/repository/user_repository.dart';

import 'package:pharma/Core/user/domain/use_case/user_info_use_case.dart';
import 'package:pharma/features/login/data/datasources/login_remote_data.dart';
import 'package:pharma/features/login/data/repositories/login_repository_imp.dart';
import 'package:pharma/features/login/domain/repositories/login_repository.dart';
import 'package:pharma/features/login/domain/usecases/login_use_case.dart';
import 'package:pharma/features/login/presentation/bloc/login_bloc.dart';
import 'package:pharma/features/operations/data/datasources/account_statment_remote.dart';
import 'package:pharma/features/operations/data/datasources/fetch_stores_remote_data.dart';
import 'package:pharma/features/operations/data/repositories/account_statment_repository_imp.dart';
import 'package:pharma/features/operations/data/repositories/stores_repository_imp.dart';
import 'package:pharma/features/operations/domain/repositories/account_statment_repository.dart';
import 'package:pharma/features/operations/domain/repositories/stores_repository.dart';
import 'package:pharma/features/operations/domain/usecases/account_statment_use_case.dart';
import 'package:pharma/features/operations/domain/usecases/fetch_stores_use_case.dart';
import 'package:pharma/features/operations/presentation/bloc/operations_bloc.dart';
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

    sl.registerFactory(
    () => OperationsBloc(
      sl(),
      sl()
    ),
  );

    sl.registerFactory(
    () => LoginBloc(
      sl(),
      sl()
    ),
  );

   // Use cases
  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCaseImp(
      sl(),
    ),
  );
    sl.registerLazySingleton<AccountStatmentUseCase>(
    () => AccountStatmentUseCaseImp(
      sl(),
    ),
  );


    sl.registerLazySingleton<FetchStoresUseCase>(
    () => FetchStoresUseCaseImp(
      sl(),
    ),
  );


 sl.registerLazySingleton<SaveToken>(
    () => SaveToken(
      sl(),
    ),
  );
   


    sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCaseImp(
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

    sl.registerLazySingleton<AccountStatmentRepository>(
    () => AccountStatmentRepositoryImp(
      sl(),
      sl(),
    ),

  );  


  sl.registerLazySingleton<StoresRepository>(
    () => StoresRepositoryImp(
      sl(),
      sl(),
    ),

  );  
    sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImp(
      sl(),
      sl(),
    ),

  );  
    sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImp(
      sl(),
      sl(),
    ),

  );  





   // Data sources
  sl.registerLazySingleton<RegisterPharmacyRemoteData>(
    () => RegisterPharmacyRemoteDataImp(sl(), sl()),
  );

   sl.registerLazySingleton<AccountStatmentRemoteData>(
    () => AccountStatmentRemoteDataImp(sl(), sl()),
  );

    sl.registerLazySingleton<FetchStoresRemoteData>(
    () => FetchStoresRemoteDataImp(sl(), sl()),
  );

    sl.registerLazySingleton<LoginRemoteData>(
    () => LoginRemoteDataImp(sl(), sl()),
  );

    sl.registerLazySingleton<UserLocatData>(
    () => UserLocatDataImp(sl(), ),
  );

  sl.registerLazySingleton<NetworkFunctions>(
    () => NetworkFunctionsImp(),
  );
  sl.registerLazySingleton<NetworkInf>(
    () => NetworkInfImpl(),
  );
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //! External
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);



}
