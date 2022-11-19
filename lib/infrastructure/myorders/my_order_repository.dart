import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/myorders/my_orders.dart';
import 'my_order_repo.dart';

class MyOrderRepository extends MyOrderRepo {
  MyOrderRepository() : firestore = FirebaseFirestore.instance;
  final FirebaseFirestore firestore;
  @override
  Stream<List<MyOrders>> getAllOrders() {
    return firestore.collection('checkout').snapshots().map(
      (QuerySnapshot<Map<String, dynamic>> snapShot) {
        return snapShot.docs
            .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                MyOrders.fromSnapshot(doc))
            .toList();
      },
    );
  }
}
