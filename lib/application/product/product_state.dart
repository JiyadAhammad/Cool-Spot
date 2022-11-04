part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoding extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class ProductLoded extends ProductState {
  const ProductLoded({
    this.products = const <Product>[],
  });
  final List<Product> products;
  @override
  List<Object> get props => <Object>[products];
}

class ProductError extends ProductState {
  @override
  List<Object> get props => <Object>[];
}
