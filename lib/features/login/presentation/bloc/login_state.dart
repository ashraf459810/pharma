part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();  

  @override
  List<Object> get props => [];
}
class LoginInitial extends LoginState {}


class Error extends LoginState {
  final String error ;

  Error(this.error);

}

class Loading extends LoginState {}


class GetLoginState extends LoginState {
  final String result ;

  GetLoginState(this.result);

}