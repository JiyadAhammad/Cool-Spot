import 'package:flutter/material.dart';

import '../../domain/cart/cart_model/cart_model.dart';
import '../cart/widget/stack_price_container.dart';
import '../constant/sizedbox/sizedbox.dart';

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'SUBTOTAL',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '₹ ${Cart().subTotalString}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          kheight5,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Delivery Fee',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '₹ ${Cart().deliveryFees}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          StackPriceContainerWidget(
            text: 'TOTAL',
            price: '₹ ${Cart().totalPrices}',
          )
        ],
      ),
    );
  }
}
