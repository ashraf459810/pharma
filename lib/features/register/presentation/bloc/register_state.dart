part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();  

  @override
  List<Object> get props => [];
}
class RegisterInitial extends RegisterState {}



class Error extends RegisterState {
  final String error ;

  Error(this.error);

}


class Loading extends RegisterState{}

class GetRegisterState extends RegisterState {
  final String result ;

  GetRegisterState(this.result);

}

class FetchRolesState extends RegisterState {
  final RolesModel rolesModel ;

  FetchRolesState(this.rolesModel);
}

class LoadingRolesState extends RegisterState {}


class GetLocaionState extends RegisterState {
  final Position position ;

  GetLocaionState(this.position);

}