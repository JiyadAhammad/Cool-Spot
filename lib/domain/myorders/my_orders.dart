import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyOrders extends Equatable {
  const MyOrders({
    required this.products,
    required this.total,
  });

  final List<MyOrders>? products;
  final String? total;

  @override
  List<Object?> get props => <Object?>[
        products,
        total,
      ];

  static MyOrders fromSnapshot(DocumentSnapshot<Object> snapshot) {
    final MyOrders myOrders = MyOrders(
      products: snapshot['product'] as List<MyOrders>,
      total: snapshot['total'] as String,
    );
    return myOrders;
  }
}
