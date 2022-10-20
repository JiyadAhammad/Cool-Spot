import 'package:equatable/equatable.dart';

import '../../home/product_model/product_model.dart';

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
          'https://img.taste.com.au/RemyDecY/w720-h480-cfill-q80/taste/2020/01/jan20_easy-berry-smoothie-taste-156331-1.jpg',
      productName: 'Coca cola',
      productPrice: 40.0,
      category: 'Cool Drinks',
      isrecommended: true,
      ispopular: true,
    ),
    const Product(
      imageUrl:
          'https://3.imimg.com/data3/DS/UB/MY-14503484/soft-drink-500x500.png',
      productName: 'Dew',
      productPrice: 40.0,
      category: 'Cool Drinks',
      isrecommended: true,
      ispopular: false,
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
