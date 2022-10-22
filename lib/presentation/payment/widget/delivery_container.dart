import 'package:flutter/material.dart';

import 'payment_method.dart';

class CashOnDeliveryContainer extends StatelessWidget {
  const CashOnDeliveryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        PaymentMethod(
          image: 'assets/images/money.png',
          text: 'Cash on Delivery',
        ),
        PaymentMethod(
          image: 'assets/images/googlepay.png',
          text: 'Google Pay',
        ),
        PaymentMethod(
          image: 'assets/images/paypal.png',
          text: 'RazorPay',
        ),
      ],
    );
  }
}
