import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/product_model/product_model.dart';
import '../../../infrastructure/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoding()) {
    on<LoadProduct>(onLoadCart);
    on<UpdateProduct>(onUpdateProduct);
  }
  final ProductRepository _productRepository;
  StreamSubscription<dynamic>? _productSubscription;

  Future<void> onLoadCart(
    LoadProduct event,
    Emitter<ProductState> emit,
  ) async {
    _productSubscription?.cancel();
    _productSubscription = _productRepository.getAllProduct().listen(
          (List<Product> event) => add(
            UpdateProduct(event),
          ),
        );
  }

  void onUpdateProduct(
    UpdateProduct event,
    Emitter<ProductState> emit,
  ) {
    emit(ProductLoded(
      products: event.products,
    ));
  }
}
