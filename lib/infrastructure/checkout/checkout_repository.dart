import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/checkout/checkout_model.dart';
import 'icheckout_repo.dart';

class CheckoutRepository extends ICheckoutRepo {
  CheckoutRepository() : fireStore = FirebaseFirestore.instance;

  final FirebaseFirestore fireStore;
  @override
  Future<Future<DocumentReference<Map<String, dynamic>>>> addCheckout(
      Checkout checkout) async {
    return fireStore.collection('checkout').add(
          checkout.toDocument(),
        );
  }
}
