import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      // leading: SizedBox(
      //   width: 100,
      //   child: Image.network(
      //     Product.products[index].imageUrl,
      //   ),
      // ),
      title: Text(
        'Product.products[index].productName',
        style: TextStyle(
          color: kblack,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      subtitle: Text(
        'Product.products[index].productPrice.toString()',
        style: TextStyle(
          color: kblack,
          fontSize: 20,
        ),
      ),
    );
  }
}
