import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:pay/pay.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../application/payment/payment_method_bloc.dart';
import '../../domain/checkout/checkout_model.dart';
import '../../domain/payment/payment.dart';
import '../../domain/product_model/product_model.dart';
import '../../infrastructure/checkout/checkout_repository.dart';
import '../../infrastructure/checkout/icheckout_repo.dart';
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

  final CheckoutRepository iCheckoutRepo = CheckoutRepository();

  @override
  void initState() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, paymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWallet);
    super.initState();
  }

  void paymentSuccess(PaymentSuccessResponse response) {
    log('Payment Success');
    Get.snackbar('title', 'message');
    Navigator.pushReplacementNamed(context, '/checkout');
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
        child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
          builder: (BuildContext context, PaymentMethodState state) {
            if (state is PaymentMethodLoding) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: kwhiteIcon,
                ),
              );
            }
            if (state is PaymentMethodLoded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const PriceDetailsWidget(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kblack,
                    ),
                    onPressed: () {
                      razorpay.open(options);
                    },
                    child: const Text(
                      'Pay With RazorPay',
                      style: TextStyle(
                        color: kwhiteText,
                      ),
                    ),
                  ),
                  if (Platform.isAndroid)
                    RawGooglePayButton(
                      onPressed: () {
                        Get.snackbar(
                          'Error',
                          'Try RazorPay',
                          dismissDirection: DismissDirection.horizontal,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: kblack,
                          titleText: const Text(
                            'Error',
                            style: TextStyle(
                              color: kwhiteText,
                            ),
                          ),
                          messageText: const Text(
                            'Try RazorPay',
                            style: TextStyle(
                              color: kwhiteText,
                            ),
                          ),
                        );
                      },
                    )
                  else
                    const SizedBox(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kblack,
                    ),
                    onPressed: () {
                      // razorpay.open(options);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cash on Delivery',
                      style: TextStyle(
                        color: kwhiteText,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Text('data');
            }
          },
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
