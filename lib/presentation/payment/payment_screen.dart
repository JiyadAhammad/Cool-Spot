import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

import '../../application/bloc/checkout/checkout_bloc.dart';
import '../../application/bloc/payment/payment_method_bloc.dart';
import '../../domain/payment/payment.dart';
import '../constant/color/colors.dart';
import '../razorpay/razorpay.dart';
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
                BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (BuildContext context, CheckoutState state) {
                    if (state is CheckoutLoding) {
                      return const Center(
                        child: CupertinoActivityIndicator(
                          color: kblack,
                        ),
                      );
                    }
                    if (state is CheckoutLoded) {
                      return ElevatedButton.icon(
                        style:
                            ElevatedButton.styleFrom(backgroundColor: kwhite),
                        onPressed: () {
                          log('${state.total!} total amount');

                          Navigator.of(context).push(
                            MaterialPageRoute<dynamic>(
                              builder: (_) => RazorPay(
                                total: state.total!,
                                products: state.products!,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.payment),
                        label: const Text('Pay with Razor Pay'),
                      );
                      // if (state.paymentMethodType == PaymentMethodType.razor_pay) {
                      //   // return RazorPay(total: total, products: products)
                      //   // return RazorPay(
                      //   //   total: state.total!,
                      //   //   products: state.products!,
                      //   // );
                      //   return ElevatedButton.icon(
                      //     style: ElevatedButton.styleFrom(backgroundColor: kwhite),
                      //     onPressed: () {
                      //       log('${state.total!} total amount');

                      //       Navigator.of(context).push(
                      //         MaterialPageRoute<dynamic>(
                      //           builder: (_) => RazorPay(
                      //             total: state.total!,
                      //             products: state.products!,
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //     icon: const Icon(Icons.payment),
                      //     label: const Text(''),
                      //   );
                      //   // return RazorPay(
                      //   //   total: state.total!,
                      //   //   products: state.products!,
                      //   // );

                      //   // return Text(
                      //   //   'Pay with Razorpay',
                      //   //   style: Theme.of(context)
                      //   //       .textTheme
                      //   //       .headline4!
                      //   //       .copyWith(color: Colors.white),
                      //   // );
                      // }
                      // if (Platform.isAndroid &&
                      //     state.paymentMethodType == PaymentMethodType.google_pay) {
                      //   return GooglePay(
                      //     products: state.products!,
                      //     total: state.total!,
                      //   );

                      //   // default:
                      //   //   return GooglePay(
                      //   //     products: state.products!,
                      //   //     total: state.total!,
                      //   //   );

                      // } else {
                      //   return ElevatedButton(
                      //     onPressed: () {
                      //       Navigator.pushNamed(context, '/payment');
                      //     },
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Colors.black,
                      //     ),
                      //     child: Text(
                      //       'CHOOSE PAYMENT',
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .headline6!
                      //           .copyWith(color: kwhite),
                      //     ),
                      //   );
                      // }
                    } else {
                      return const Text('Something went wrong');
                    }
                  },
                ),
                // BlocBuilder<SubjectBloc, SubjectState>(
                //   builder: (context, state) {
                //     return ElevatedButton(
                //       onPressed: () {
                //         // context.read<PaymentMethodBloc>().add(
                //         //       const SelectPayment(
                //         //         paymentItem: PaymentMethodType.razor_pay,
                //         //       ),
                //         //     );
                //         // Navigator.pop(context);
                //       },
                //       child: const Text('Pay with Razor Pay'),
                //     );
                //   },
                // ),
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
