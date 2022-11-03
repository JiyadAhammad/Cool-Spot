import '../../domain/category_model/category_model.dart';

abstract class ICategoryRepo {
  Stream<List<Category>> getAllCategory();
}
