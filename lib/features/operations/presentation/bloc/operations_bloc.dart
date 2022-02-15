import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'operations_event.dart';
part 'operations_state.dart';

class OperationsBloc extends Bloc<OperationsEvent, OperationsState> {
  OperationsBloc() : super(OperationsInitial()) {
    on<OperationsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
