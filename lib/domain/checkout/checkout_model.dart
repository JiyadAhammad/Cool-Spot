import 'package:equatable/equatable.dart';

import '../product_model/product_model.dart';

class Checkout extends Equatable {
  const Checkout({
    required this.location,
    required this.address,
    required this.city,
    required this.landMark,
    required this.products,
    required this.subTotal,
    required this.deliveryFee,
    required this.total,
  });

  final String? location;
  final String? address;
  final String? city;
  final String? landMark;
  final List<Product>? products;
  final String? subTotal;
  final String? deliveryFee;
  final String? total;

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
      ];

  Map<String, Object> toDocument() {
    final Map<String, dynamic> customerAddress = <String, dynamic>{};
    customerAddress['location'] = location;
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['landMark'] = landMark;
    return <String, Object>{
      'customerAddress': customerAddress,
      'Product': products!.map((Product item) => item.productName).toList(),
      'subTotal': subTotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
    };
  }
}
