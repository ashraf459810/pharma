part of 'transfer_bloc.dart';

abstract class TransferState extends Equatable {
  const TransferState();  

  @override
  List<Object> get props => [];
}
class TransferInitial extends TransferState {}
