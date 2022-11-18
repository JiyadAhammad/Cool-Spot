import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../application/payment/payment_method_bloc.dart';
import '../../domain/payment/payment.dart';
import '../../domain/product_model/product_model.dart';
import '../constant/color/colors.dart';
import '../google_pay/google_pay.dart';

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
    log(widget.total);
    final double totalPrice = double.parse(widget.total) * 100;
    log(totalPrice.toString());
    // int totalPrice = int.parse(widget.total * 100);
    // log(totalPrice.toString());
    final Map<String, Object> options = <String, Object>{
      'key': 'rzp_live_3hNvMCaWqLWH5k',
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
            children: [
              ElevatedButton(
                onPressed: () {
                  razorpay.open(options);
                },
                child: const Text('data'),
              ),
              if (Platform.isAndroid)
                RawGooglePayButton(
                  onPressed: () {
                    GooglePay(
                      total: widget.total,
                      products: widget.products,
                    );
                    //     if (Platform.isAndroid &&
                    //   state.paymentMethodType == PaymentMethodType.google_pay) {
                    // return GooglePay(
                    //   products: state.products!,
                    //   total: state.total!,
                    // );
                    // context.read<PaymentMethodBloc>().add(
                    //       const SelectPayment(
                    //         paymentItem: PaymentMethodType.google_pay,
                    //       ),
                    //     );
                  },
                )
              else
                const SizedBox(),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }
}
