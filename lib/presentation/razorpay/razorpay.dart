import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../domain/product_model/product_model.dart';

class RazorPay extends StatefulWidget {
  RazorPay({
    super.key,
    required this.total,
    required this.products,
  });
  final String total;
  final List<Product> products;

  @override
  State<RazorPay> createState() => _RazorPayState();
}

class _RazorPayState extends State<RazorPay> {
  final Razorpay razorpay = Razorpay();

  @override
  void initState() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    log('Payment Success');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    log('Payment failed');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
    );
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }
}
