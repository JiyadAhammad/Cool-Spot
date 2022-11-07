part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class UpdateChekout extends CheckoutEvent {
  const UpdateChekout({
    this.location,
    this.address,
    this.city,
    this.landMark,
    this.cart,
  });

  final String? location;
  final String? address;
  final String? city;
  final String? landMark;
  final Cart? cart;

  @override
  List<Object?> get props => <Object?>[
        location,
        address,
        city,
        landMark,
        cart,
      ];
}

class ConfirmChekout extends CheckoutEvent {
  const ConfirmChekout({
    required this.checkout,
  });

  final Checkout checkout;

  @override
  List<Object?> get props => <Object?>[checkout];
}
