part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => <Object>[];
}

class LoadProduct extends ProductEvent {}

class UpdateProduct extends ProductEvent {
  const UpdateProduct(this.products);

  final List<Product> products;
  @override
  List<Object> get props => <Object>[products];
}
