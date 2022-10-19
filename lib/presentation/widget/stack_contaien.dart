import 'package:flutter/material.dart';

import '../../domain/home/product_model/product_model.dart';
import '../constant/color/colors.dart';

class StackContainerWidget extends StatelessWidget {
  const StackContainerWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 6,
            // color: kwhite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kwhite,
            ),
            alignment: Alignment.topCenter,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width - 10,
            height: MediaQuery.of(context).size.width / 6 - 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kblack,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    product.productName,
                    style: const TextStyle(color: kwhiteText),
                  ),
                  Text(
                    '₹ ${product.productPrice}',
                    style: const TextStyle(color: kwhiteText),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
