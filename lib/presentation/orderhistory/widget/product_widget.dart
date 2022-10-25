import 'package:flutter/material.dart';

import '../../../domain/home/product_model/product_model.dart';
import '../../constant/color/colors.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 100,
        child: Image.network(
          Product.products[index].imageUrl,
        ),
      ),
      title: Text(
        Product.products[index].productName,
        style: const TextStyle(
          color: kblack,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      subtitle: Text(
        Product.products[index].productPrice.toString(),
        style: const TextStyle(
          color: kblack,
          fontSize: 20,
        ),
      ),
    );
  }
}
