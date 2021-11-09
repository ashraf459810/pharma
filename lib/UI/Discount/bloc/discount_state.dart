part of 'discount_bloc.dart';

@immutable
abstract class DiscountState {}

class DiscountInitial extends DiscountState {}

class DiscountWelcomeState extends DiscountState {
  final bool isfirsttime;

  DiscountWelcomeState(this.isfirsttime);
}
