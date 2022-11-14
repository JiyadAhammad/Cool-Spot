import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../../../domain/product_model/product_model.dart';
import '../../google_pay/google_pay.dart';
import 'payment_method.dart';

class CashOnDeliveryContainer extends StatelessWidget {
  const CashOnDeliveryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const PaymentMethod(
          image: 'assets/images/money.png',
          text: 'Cash on Delivery',
        ),
        if (Platform.isAndroid)
          RawGooglePayButton(
            onPressed: () {
              log('google pay selected');
              GooglePay(total: '10', products: Product.products);
            },
          )
        else
          const SizedBox(),
        // PaymentMethod(
        //   image: 'assets/images/googlepay.png',
        //   text: 'Google Pay',
        // ),

        const PaymentMethod(
          image: 'assets/images/paypal.png',
          text: 'RazorPay',
        ),
      ],
    );
  }
}
