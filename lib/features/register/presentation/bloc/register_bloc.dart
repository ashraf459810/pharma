

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pharma/Core/user/domain/use_case/user_info_use_case.dart';
import 'package:pharma/features/register/data/models/register_pharma_request_model.dart';
import 'package:pharma/features/register/data/models/roles_model.dart';
import 'package:pharma/features/register/domain/usecases/fetch_roles_use_case.dart';
import 'package:pharma/features/register/domain/usecases/register_use_case.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase ;
  final FetchRolesUseCase fetchRolesUseCase;
  final SetIsVerify setIsVerify;
  RegisterBloc(this.registerUseCase, this.fetchRolesUseCase, this.setIsVerify) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is RegisterPharmaEvent){
        emit (Loading());
        var response = await registerUseCase.registerUseCase(event.registerPharmaRequestodel, event.images); 
        print(response);
      response.fold((l) => emit(Error(l.error)), (r) async {   
         if (
          r == "AWAITING_ACTIVATION") {
                //  await  setIsVerify.call(event.registerPharmaRequestodel.belongType).then((value) =>
          emit(GetRegisterState(r));
          // );
          }     else {
          emit (Error(r));}
          });
      }
           if (event is FetchRolesEvent){     
        emit (Loading());
        var response = await fetchRolesUseCase.fetchRolesUseCase();
          print(response);
      response.fold((l) => emit(Error(l.error)), (r)  {
         if (
          r.azsvr == "SUCCESS") {
          emit(FetchRolesState(r));}     else {
          emit (Error('حدثت مشكلة في المعالجة'));}
          });
      }

      if (event is GetLocationEvent){
        emit(Loading());
        await Permission.location.isGranted;
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

          print(position);
          
     emit (GetLocaionState(position));}
        
      

    });
  }
}


// Future<Position> determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled don't continue
//     // accessing the position and request users of the 
//     // App to enable the location services.
//     return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       // Permissions are denied, next time you could try
//       // requesting permissions again (this is also where
//       // Android's shouldShowRequestPermissionRationale 
//       // returned true. According to Android guidelines
//       // your App should show an explanatory UI now.
//       return Future.error('Location permissions are denied');
//     }
//   }
  
//   if (permission == LocationPermission.deniedForever) {
//     // Permissions are denied forever, handle appropriately. 
//     return Future.error(
//       'Location permissions are permanently denied, we cannot request permissions.');
//   } 

//   // When we reach here, permissions are granted and we can
//   // continue accessing the position of the device.
//   return await Geolocator.getCurrentPosition();
// }
