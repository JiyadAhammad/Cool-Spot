import 'package:hive/hive.dart';

import '../../product_model/product_model.dart';

abstract class IWishRepo {
  Future<Box<dynamic>> openBox();
  List<Product> getWishlist(Box<dynamic> box);
  Future<void> addProductToWishlist(Box<dynamic> box, Product product);
  Future<void> removeProductFromWishlist(Box<dynamic> box, Product product);
  Future<void> clearWishlist(Box<dynamic> box);
}
