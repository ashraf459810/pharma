import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:pharma/Data/Repository/IRepository.dart';
import 'package:pharma/injection.dart';

part 'discount_event.dart';
part 'discount_state.dart';

class DiscountBloc extends Bloc<DiscountEvent, DiscountState> {
  DiscountBloc() : super(DiscountInitial()) {
    var repo = sl.get<IRepository>();
    on<DiscountEvent>((event, emit) async* {
      if (event is DiscountWelcomeEvent) {
        bool result = await repo.iprefsHelper.getfirstvisit() ?? false;
        yield DiscountWelcomeState(result);
      }
    });
  }
}
