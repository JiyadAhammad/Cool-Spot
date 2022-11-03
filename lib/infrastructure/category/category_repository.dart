import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/category_model/category_model.dart';
import 'icategoryrpo.dart';

class CategoryRepository extends ICategoryRepo {
  CategoryRepository() : fireStore = FirebaseFirestore.instance;

  final FirebaseFirestore fireStore;
  @override
  Stream<List<Category>> getAllCategory() {
    return fireStore.collection('catergory').snapshots().map(
      (QuerySnapshot<Map<String, dynamic>> snapShot) {
        return snapShot.docs
            .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                Category.fromSnapshot(doc))
            .toList();
      },
    );
  }
}
