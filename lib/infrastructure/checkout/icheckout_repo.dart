import '../../domain/checkout/checkout_model.dart';

abstract class ICheckoutRepo {
  Future<void> addCheckout(Checkout checkout);
}
