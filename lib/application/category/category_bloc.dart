import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/category_model/category_model.dart';
import '../../infrastructure/category/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoding()) {
    on<LoadCategories>(onLoadCart);
    on<UpdateCategories>(onUpdateCategory);
  }
  final CategoryRepository _categoryRepository;
  StreamSubscription<dynamic>? _categorySubscription;

  Future<void> onLoadCart(
    LoadCategories event,
    Emitter<CategoryState> emit,
  ) async {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.getAllCategory().listen(
          (List<Category> event) => add(
            UpdateCategories(event),
          ),
        );
  }

  void onUpdateCategory(
    UpdateCategories event,
    Emitter<CategoryState> emit,
  ) {
    emit(
      CategoryLoded(
        categories: event.categories,
      ),
    );
  }
}
