part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => <Object>[];
}

class LoadCategories extends CategoryEvent {}

class UpdateCategories extends CategoryEvent {
  const UpdateCategories(this.categories);

  final List<Category> categories;
  @override
  List<Object> get props => <Object>[categories];
}
