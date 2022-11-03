import '../../domain/category_model/category_model.dart';
import '../../domain/product_model/product_model.dart';

abstract class ICategoryRepo {
  Stream<List<Category>> getAllCategory();
}
