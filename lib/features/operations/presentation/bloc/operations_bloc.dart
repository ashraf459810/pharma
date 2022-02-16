import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:pharma/features/operations/data/models/stores_model.dart';
import 'package:pharma/features/operations/domain/usecases/account_statment_use_case.dart';
import 'package:pharma/features/operations/domain/usecases/fetch_stores_use_case.dart';

part 'operations_event.dart';
part 'operations_state.dart';

class OperationsBloc extends Bloc<OperationsEvent, OperationsState> {
  final AccountStatmentUseCase accountStatmentUseCase;
  final FetchStoresUseCase fetchStoresUseCase ;
  OperationsBloc(this.fetchStoresUseCase, this.accountStatmentUseCase) : super(OperationsInitial()) {
    
    on<OperationsEvent>((event, emit) async {

      if (event is FetchStoresEvent){
        emit (Loading());
        var response = await fetchStoresUseCase.fetchStoresUseCase();
        response.fold((l) => emit(Error(l.error)), (r){
          r.azsvr =='SUCCESS'?
          emit (FetchStoresState(r)):
          emit (Error('خطا في معالجة الطلب'));

        });
        
      }
      if (event is AccountStatmentEvent){         
        emit (Loading());
        var response = await accountStatmentUseCase.accountStatmentUseCase(event.fromDate, event.toDate,event. storeId, event.ticketId);
        response.fold((l) => emit(Error(l.error)), (r) {
          if (r=="SUCCESS"){
          emit(AccountStatmentState(r));}
          else {

          emit(Error('خطا في ارسال الطلب'));
          }

        });
      }
     
    });
  }

 
}
