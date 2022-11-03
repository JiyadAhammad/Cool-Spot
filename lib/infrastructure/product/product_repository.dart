import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/product_model/product_model.dart';
import 'iproduct_repo.dart';

class ProductRepository extends IProductRepo {
  ProductRepository() : firestore = FirebaseFirestore.instance;
  final FirebaseFirestore firestore;
  @override
  Stream<List<Product>> getAllProduct() {
    return firestore.collection('products').snapshots().map(
      (QuerySnapshot<Map<String, dynamic>> snapShot) {
        return snapShot.docs
            .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                Product.fromSnapshot(doc))
            .toList();
      },
    );
  }
}
