import 'package:hive/hive.dart';

import '../../../domain/product_model/product_model.dart';
import '../../../domain/whishlist/core/i_wish_repo.dart';

class WhishlistRepository extends IWishRepo {
  String boxName = 'whish';
  Type boxType = Product;

  @override
  Future<Box<dynamic>> openBox() async {
    final Box<dynamic> box = await Hive.openBox<Product>(boxName);
    return box;
  }

  @override
  Future<void> addProductToWishlist(Box<dynamic> box, Product product) async {
    await box.put(product.id, product);
  }

  @override
  Future<void> removeProductFromWishlist(
      Box<dynamic> box, Product product) async {
    await box.delete(product.id);
  }

  @override
  List<Product> getWishlist(Box<dynamic> box) {
    return box.values.toList() as List<Product>;
  }

  @override
  Future<void> clearWishlist(Box<dynamic> box) async {
    await box.clear();
  }
}
