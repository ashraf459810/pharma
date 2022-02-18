part of 'operations_bloc.dart';

abstract class OperationsState extends Equatable {
  const OperationsState();  

  @override
  List<Object> get props => [];
}
class OperationsInitial extends OperationsState {}


class Loading extends OperationsState {
 
}

class Error extends OperationsState {
  final String error ;

  Error(this.error);
}

class FetchStoresState extends OperationsState {
  final StoresModel storesModel;

  FetchStoresState(this.storesModel);

}

class AccountStatmentState extends OperationsState {
  final String result;

  AccountStatmentState(this.result);

}

class PharmacyTicketsState extends OperationsState {
  final PharmacyTicketsModel pharmacyTicketsModel ;

  PharmacyTicketsState(this.pharmacyTicketsModel);
}

class LoadingTickets extends OperationsState{}