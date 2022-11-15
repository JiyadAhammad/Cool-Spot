part of 'payment_method_bloc.dart';

abstract class PaymentMethodEvent extends Equatable {
  const PaymentMethodEvent();

  @override
  List<Object> get props => <Object>[];
}

class LoadPayment extends PaymentMethodEvent {}

class SelectPayment extends PaymentMethodEvent {
  const SelectPayment({
    required this.paymentItem,
  });

  final PaymentMethodType paymentItem;

  @override
  List<Object> get props => <Object>[paymentItem];
}
