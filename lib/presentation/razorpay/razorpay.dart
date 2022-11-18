import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../domain/product_model/product_model.dart';
import '../constant/color/colors.dart';
import '../widget/price_details_widget.dart';

class RazorPay extends StatefulWidget {
  const RazorPay({
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
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, paymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWallet);
    super.initState();
  }

  void paymentSuccess(PaymentSuccessResponse response) {
    log('Payment Success');
    Navigator.pushNamed(context, '/confirm');
  }

  void paymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    log('Payment failed');
  }

  void externalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    log(widget.total);
    final double totalPrice = double.parse(widget.total) * 100;
    log(totalPrice.toString());
    // int totalPrice = int.parse(widget.total * 100);
    // log(totalPrice.toString());
    final Map<String, Object> options = <String, Object>{
      'key': 'rzp_test_iEQjQ8PRi37rvC',
      'amount': totalPrice, //in the smallest currency sub-unit.
      'name': 'Acme Corp.',
      // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
      // 'description': 'Fine T-Shirt',
      'timeout': 120, // in seconds
      'prefill': <String, String>{
        'contact': '6282615775',
        'email': 'gaurav.kumar@example.com',
      }
    };
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PriceDetailsWidget(),
            ElevatedButton(
              onPressed: () {
                razorpay.open(options);
              },
              child: const Text('Confirm Pay'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }
}
