import 'package:equatable/equatable.dart';

import '../product_model/product_model.dart';

class WhishList extends Equatable {
  const WhishList({
    this.product = const <Product>[],
  });

  final List<Product> product;
  @override
  List<Object?> get props => <Object>[product];
}
