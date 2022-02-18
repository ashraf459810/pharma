part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}


class RegisterPharmaEvent extends RegisterEvent {
  final RegisterPharmaRequestodel registerPharmaRequestodel ;
  final List<XFile> images ;

  RegisterPharmaEvent(this.registerPharmaRequestodel, this.images); 
}

class FetchRolesEvent extends RegisterEvent {}