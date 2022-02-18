part of 'operations_bloc.dart';

abstract class OperationsEvent extends Equatable {
  const OperationsEvent();

  @override
  List<Object> get props => [];
}


class FetchStoresEvent extends OperationsEvent {
  
}


class AccountStatmentEvent extends OperationsEvent {
  final String toDate;
  final String fromDate;
  final String storeId;
  final String ticketId;

  AccountStatmentEvent(this.toDate, this.fromDate, this.storeId, this.ticketId);
}

class PharmacyTicketsEvent extends OperationsEvent {
  
}