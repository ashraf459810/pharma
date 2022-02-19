import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharma/Core/user/domain/use_case/user_info_use_case.dart';
import 'package:pharma/features/login/domain/usecases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
final LoginUseCase loginUseCase;
final SaveToken saveToken;
  LoginBloc(this.loginUseCase, this.saveToken) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
   if (event is GetUseLoginEvent){
     log('here from bloc');
      emit(Loading());
      var response = await loginUseCase.loginUseCase(event.email, event.passwrod);
      response.fold((l) => emit(Error(l.error)), (r)  async {
        if (r !='FAILED'){
              saveToken.call(r);
 emit(GetLoginState(r));
        }
        else {
          emit (Error(r));
       
        }
   
    });
   }});}

}