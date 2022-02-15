part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}



class GetUseLoginEvent extends LoginEvent {
  final String email ; 
  final String passwrod;

  GetUseLoginEvent(this.email, this.passwrod);

}
