import '../../domain/product_model/product_model.dart';

abstract class IProductRepo {
  Stream<List<Product>> getAllProduct();
}
