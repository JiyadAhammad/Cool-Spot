part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => <Object>[];
}

class CheckoutLoding extends CheckoutState {}

class CheckoutLoded extends CheckoutState {
  CheckoutLoded({
    this.location,
    this.address,
    this.city,
    this.landMark,
    this.products,
    this.subTotal,
    this.deliveryFee,
    this.total,
    this.paymentMethodType = PaymentMethodType.google_pay,
  }) : checkout = Checkout(
          location: location,
          address: address,
          city: city,
          landMark: landMark,
          products: products,
          subTotal: subTotal,
          deliveryFee: deliveryFee,
          total: total,
        );

  final String? location;
  final String? address;
  final String? city;
  final String? landMark;
  final List<Product>? products;
  final String? subTotal;
  final String? deliveryFee;
  final String? total;
  final Checkout checkout;
  final PaymentMethodType paymentMethodType;

  @override
  List<Object?> get props => <Object?>[
        location,
        address,
        city,
        landMark,
        products,
        subTotal,
        deliveryFee,
        total,
        paymentMethodType
      ];
}
