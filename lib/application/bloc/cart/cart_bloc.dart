import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/cart/cart_model/cart_model.dart';
import '../../../domain/product_model/product_model.dart';


part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(onLoadCart);
    on<CartProductAdded>(onAddProduct);
    on<RemoveCartProduct>(onRemoveProduct);
  }

  Future<void> onLoadCart(
    LoadCart event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    try {
      await Future<dynamic>.delayed(
        const Duration(seconds: 1),
      );
      emit(
        const CartLoaded(),
      );
    } catch (e) {
      emit(
        CartError(),
      );
    }
  }

  void onAddProduct(
    CartProductAdded event,
    Emitter<CartState> emit,
  ) {
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              product: List<Product>.from(
                (state as CartLoaded).cart.product,
              )..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(
          CartError(),
        );
      }
    }
  }

  void onRemoveProduct(
    RemoveCartProduct event,
    Emitter<CartState> emit,
  ) {
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              product: List<Product>.from(
                (state as CartLoaded).cart.product,
              )..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(
          CartError(),
        );
      }
    }
  }
}
