part of 'operations_bloc.dart';

abstract class OperationsState extends Equatable {
  const OperationsState();  

  @override
  List<Object> get props => [];
}
class OperationsInitial extends OperationsState {}
