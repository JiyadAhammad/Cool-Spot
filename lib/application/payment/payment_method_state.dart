part of 'payment_method_bloc.dart';

abstract class PaymentMethodState extends Equatable {
  const PaymentMethodState();
  
  @override
  List<Object> get props => [];
}

class PaymentMethodInitial extends PaymentMethodState {}
