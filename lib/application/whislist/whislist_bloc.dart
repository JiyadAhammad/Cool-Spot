import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';


import '../../domain/product_model/product_model.dart';
import '../../domain/whishlist/whish_list.dart';
import '../../infrastructure/cart/whishlist/whish_list.dart';

part 'whislist_event.dart';
part 'whislist_state.dart';

class WhislistBloc extends Bloc<WhislistEvent, WhislistState> {
  WhislistBloc({
    required WhishlistRepository whishlistRepository,
  })  : _whishlistRepository = whishlistRepository,
        super(WhislistLoding()) {
    on<LoadWishList>(loadWishList);
    on<AddtoWishList>(addtoWishList);
    on<RemovefromWishList>(removefromWishList);
  }
  final WhishlistRepository _whishlistRepository;

  FutureOr<void> loadWishList(
    LoadWishList event,
    Emitter<WhislistState> emit,
  ) async {
    emit(
      WhislistLoding(),
    );
    try {
      final Box<dynamic> box = await _whishlistRepository.openBox();
      final List<Product> products = _whishlistRepository.getWishlist(box);
      await Future<void>.delayed(
        const Duration(seconds: 2),
      );
      emit(
        WhislistLoded(
          whishList: WhishList(product: products),
        ),
      );
    } catch (_) {
      emit(
        WhislistError(),
      );
    }
  }

  FutureOr<void> addtoWishList(
    AddtoWishList event,
    Emitter<WhislistState> emit,
  ) async {
    // final WhislistState state = this.state;
    if (state is WhislistLoded) {
      final Box<dynamic> box = await _whishlistRepository.openBox();
      _whishlistRepository.addProductToWishlist(box, event.product);
      try {
        emit(
          WhislistLoded(
            whishList: WhishList(
              product: List<Product>.from(
                  (state as WhislistLoded).whishList.product)
                ..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(
          WhislistError(),
        );
      }
    }
  }

  FutureOr<void> removefromWishList(
    RemovefromWishList event,
    Emitter<WhislistState> emit,
  ) async {
    // final WhislistState state = this.state;
    if (state is WhislistLoded) {
      final Box<dynamic> box = await _whishlistRepository.openBox();
      _whishlistRepository.removeProductFromWishlist(box, event.product);
      try {
        emit(
          WhislistLoded(
            whishList: WhishList(
              product: List<Product>.from(
                  (state as WhislistLoded).whishList.product)
                ..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(
          WhislistError(),
        );
      }
    }
  }
}
