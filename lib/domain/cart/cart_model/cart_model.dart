import 'package:equatable/equatable.dart';

import '../../product_model/product_model.dart';

class Cart extends Equatable {
  const Cart({this.product = const <Product>[]});
  final List<Product> product;
  double deliveryFee(double subTotals) {
    if (subTotal >= 500) {
      return 0;
    } else {
      return 20;
    }
  }

  String freedelivery(double subTotal) {
    if (subTotal >= 500) {
      return 'you have free delivery';
    } else {
      final double balance = 500.0 - subTotal;
      return 'Add ₹ ${balance.toString()} for FreeDelivery';
    }
  }

  double totalPrice(double amount, double delivery) {
    return amount + delivery;
  }

  String get freeDelivey => freedelivery(subTotal);

  String get subTotalString => subTotal.toString();

  String get deliveryFees => deliveryFee(subTotal).toString();

  String get totalPrices =>
      totalPrice(subTotal, double.parse(deliveryFees)).toString();
  double get subTotal => product.fold(
      0, (double total, Product current) => total + current.productPrice);

  @override
  List<Object?> get props => <Object?>[product];
}
