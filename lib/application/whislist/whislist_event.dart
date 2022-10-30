part of 'whislist_bloc.dart';

abstract class WhislistEvent extends Equatable {
  const WhislistEvent();


}

class StartWishList extends WhislistEvent {
    @override
  List<Object> get props => <Object>[];
}

class AddWishListProduct extends WhislistEvent {
  const AddWishListProduct(this.product);

  final Product product;

  @override
  List<Object> get props => <Object>[product];
}

class RemoveWishListProduct extends WhislistEvent {
  const RemoveWishListProduct(this.product);

  final Product product;

  @override
  List<Object> get props => <Object>[product];
}
