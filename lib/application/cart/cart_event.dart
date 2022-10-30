part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => <Object>[];
}

class LoadCart extends CartEvent {}

class CartProductAdded extends CartEvent {
  const CartProductAdded(this.product);

  final Product product;

   @override
  List<Object> get props => <Object>[product];
}

class RemoveCartProduct extends CartEvent {
    const RemoveCartProduct (this.product);

  final Product product;

   @override
  List<Object> get props => <Object>[product];
}
