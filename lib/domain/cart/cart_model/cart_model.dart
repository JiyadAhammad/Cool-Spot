import 'package:equatable/equatable.dart';

import '../../product_model/product_model.dart';

class Cart extends Equatable {
  Cart();
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
  double get subTotal => items.fold(
      0, (double total, Product current) => total + current.productPrice);
  final List<Product> items = <Product>[
    const Product(
      imageUrl:
          'https://traditionallymodernfood.com/wp-content/uploads/2020/05/vanilla-ice-cream-3-ingredients-eggless-11.jpeg',
      productName: 'Vanila',
      productPrice: 30,
      category: 'IceCream',
      isrecommended: true,
      ispopular: false,
    ),
    const Product(
      imageUrl:
          'https://static.toiimg.com/thumb/83913875.cms?width=1200&height=900',
      productName: 'Chocolate',
      productPrice: 35,
      category: 'IceCream',
      isrecommended: false,
      ispopular: true,
    ),
    const Product(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcawjcJOFIRy1lq3EKx76d4qbV8MfN13CCjg&usqp=CAU',
      productName: 'Fresh Lime',
      productPrice: 20.0,
      category: 'Smoothies',
      isrecommended: false,
      ispopular: true,
    ),
  ];
  @override
  List<Object?> get props => <Object?>[];
}
