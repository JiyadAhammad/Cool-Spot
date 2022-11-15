import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

import '../../../application/payment/payment_method_bloc.dart';
import '../../../domain/payment/payment.dart';
import '../../constant/color/colors.dart';


class CashOnDeliveryContainer extends StatelessWidget {
  const CashOnDeliveryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
      builder: (BuildContext context, PaymentMethodState state) {
        if (state is PaymentMethodLoding) {
          return const Center(
            child: CupertinoActivityIndicator(
              color: kwhiteIcon,
            ),
          );
        }
        if (state is PaymentMethodLoded) {
          return ListView(
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              // Platform.isIOS
              //     ? RawApplePayButton(
              //         style: ApplePayButtonStyle.black,
              //         type: ApplePayButtonType.inStore,
              //         onPressed: () {
              //           context.read<PaymentMethodBloc>().add(
              //                 SelectPayment(
              //                     paymentItem: PaymentMethod.apple_pay),
              //               );
              //           Navigator.pop(context);
              //         },
              //       )
              //     : SizedBox(),
              // const SizedBox(height: 10),
              if (Platform.isAndroid)
                RawGooglePayButton(
                  onPressed: () {
                    context.read<PaymentMethodBloc>().add(
                          const SelectPayment(
                            paymentItem: PaymentMethodType.google_pay,
                          ),
                        );
                    Navigator.pop(context);
                  },
                )
              else
                const SizedBox(),
              ElevatedButton(
                onPressed: () {
                  context.read<PaymentMethodBloc>().add(
                        const SelectPayment(
                          paymentItem: PaymentMethodType.razor_pay,
                        ),
                      );
                  Navigator.pop(context);
                },
                child: const Text('Pay with Credit Card'),
              ),
            ],
          );
          // return Column(
          //   children: <Widget>[
          //     const PaymentMethod(
          //       image: 'assets/images/money.png',
          //       text: 'Cash on Delivery',
          //     ),
          //     if (Platform.isAndroid)
          //       RawGooglePayButton(
          //         onPressed: () {
          //           context.read<PaymentMethodBloc>().add(
          //                 const SelectPayment(
          //                   paymentItem: PaymentMethodType.google_pay,
          //                 ),
          //               );
          //         },
          //       )
          //     else
          //       const SizedBox(),
          //     // PaymentMethod(
          //     //   image: 'assets/images/googlepay.png',
          //     //   text: 'Google Pay',
          //     // ),

          //     const PaymentMethod(
          //       image: 'assets/images/paypal.png',
          //       text: 'RazorPay',
          //     ),
          //   ],
          // );
        } else {
          return const Text('Something went wrong');
        }
      },
    );
  }
}
