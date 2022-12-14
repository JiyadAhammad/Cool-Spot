part of 'whislist_bloc.dart';

abstract class WhislistEvent extends Equatable {
  const WhislistEvent();
}

class LoadWishList extends WhislistEvent {
  @override
  List<Object> get props => <Object>[];
}

class AddtoWishList extends WhislistEvent {
  const AddtoWishList(this.product);

  final Product product;

  @override
  List<Object> get props => <Object>[product];
}

class RemovefromWishList extends WhislistEvent {
  const RemovefromWishList(this.product);

  final Product product;

  @override
  List<Object> get props => <Object>[product];
}
