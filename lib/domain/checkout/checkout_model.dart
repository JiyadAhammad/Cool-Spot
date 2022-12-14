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
    required this.isAccepted,
    required this.isDelivered,
    required this.isCanceled,
  });

  final String? location;
  final String? address;
  final String? city;
  final String? landMark;
  final List<Product>? products;
  final String? subTotal;
  final String? deliveryFee;
  final String? total;
  final bool? isAccepted;
  final bool? isDelivered;
  final bool? isCanceled;

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
        isAccepted,
        isDelivered,
        isCanceled,
      ];

  Map<String, Object> toDocument() {
    // final Map<String, dynamic> customerAddress = <String, dynamic>{};
    // customerAddress['location'] = location;
    // customerAddress['address'] = address;
    // customerAddress['city'] = city;
    // customerAddress['landMark'] = landMark;

    return <String, Object>{
      'location': location!,
      'address': address!,
      'city': city!,
      'landMark': landMark!,
      'Product': products!.map((Product item) => item.productName).toList(),
      'subTotal': subTotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
      'isAccepted': isAccepted!,
      'isDelivered': isDelivered!,
      'isCanceled': isCanceled!,
    };
  }
}
