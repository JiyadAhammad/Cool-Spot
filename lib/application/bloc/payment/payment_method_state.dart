part of 'payment_method_bloc.dart';

abstract class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => <Object>[];
}

class PaymentMethodLoding extends PaymentMethodState {}

class PaymentMethodLoded extends PaymentMethodState {
  const PaymentMethodLoded({
    this.paymentMethod = PaymentMethodType.razor_pay,
  });

  final PaymentMethodType paymentMethod;
  @override
  List<Object> get props => <Object>[paymentMethod];
}
