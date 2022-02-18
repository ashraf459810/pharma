

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/features/register/data/models/register_pharma_request_model.dart';
import 'package:pharma/features/register/data/models/roles_model.dart';
import 'package:pharma/features/register/domain/usecases/fetch_roles_use_case.dart';
import 'package:pharma/features/register/domain/usecases/register_use_case.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase ;
  final FetchRolesUseCase fetchRolesUseCase;
  RegisterBloc(this.registerUseCase, this.fetchRolesUseCase) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is RegisterPharmaEvent){
        emit (Loading());
        var response = await registerUseCase.registerUseCase(event.registerPharmaRequestodel, event.images);

      response.fold((l) => emit(Error('error')), (r) {
        print(r);
        
         if (
          r == "AWAITING_ACTIVATION") {
          emit(GetRegisterState(r));}     else {
          emit (Error(r));}
          });
      }

           if (event is FetchRolesEvent){
        emit (Loading());
        var response = await fetchRolesUseCase.fetchRolesUseCase();

      response.fold((l) => emit(Error('error')), (r) {
        print(r);
        
         if (
          r.azsvr == "SUCCESS") {
          emit(FetchRolesState(r));}     else {
          emit (Error('حدثت مشكلة في المعالجة'));}
          });
      }
      
      

    });
  }
}
