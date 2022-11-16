import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

import '../../application/checkout/checkout_bloc.dart';
import '../../application/payment/payment_method_bloc.dart';
import '../../domain/payment/payment.dart';
import '../constant/color/colors.dart';
import '../google_pay/google_pay.dart';
import '../widget/custom_app_bar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  static const String routeName = '/payment';
  static Route<PaymentScreen> route() {
    return MaterialPageRoute<PaymentScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const PaymentScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(
        leadingOnPressed: () => Navigator.pop(context),
        appBarTitle: 'Payment',
        appBarIcon: Icons.money,
        onPressed: () {},
      ),
      body: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
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
                  child: const Text('Pay with Razor Pay'),
                ),
              ],
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
