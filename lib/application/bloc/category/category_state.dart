part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => <Object>[];
}

class CategoryLoding extends CategoryState {
  @override
  List<Object> get props => <Object>[];
}

class CategoryLoded extends CategoryState {
  const CategoryLoded({
    this.categories = const <Category>[],
  });
  final List<Category> categories;
  @override
  List<Object> get props => <Object>[categories];
}

class CategoryError extends CategoryState {
  @override
  List<Object> get props => <Object>[];
}
