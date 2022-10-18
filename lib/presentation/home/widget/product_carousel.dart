import 'package:flutter/material.dart';

import '../../../domain/home/product_model/product_model.dart';
import '../../widget/product_card_widget.dart';
import '../home_screen.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    super.key,
    required this.products,
  });
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 1.9,
      // width: 10,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: ProductCardWidget(
              productItem: products[index],
            ),
          );
        },
      ),
    );
  }
}
