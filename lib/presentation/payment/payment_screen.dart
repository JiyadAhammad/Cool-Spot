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
      ),
    );
    // return Scaffold(
    //   backgroundColor: bgColor,
    //   appBar: CustomAppBar(
    //     leadingOnPressed: () => Navigator.pop(context),
    //     appBarTitle: 'Payment',
    //     appBarIcon: Icons.money,
    //     onPressed: () {},
    //   ),
    //   body: const Padding(
    //     padding: EdgeInsets.symmetric(
    //       horizontal: 20,
    //       vertical: 10,
    //     ),
    //     child: CashOnDeliveryContainer(),
    //   ),
    //   bottomNavigationBar: CutomeBottomBarWidget(
    //     text: 'Pay',
    //     onPressed: () {
    //       Navigator.pushNamed(context, '/confirm');
    //     },
    //   ),
    // );
  }
}

class OrderNowNavBar extends StatelessWidget {
  const OrderNowNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (BuildContext context, CheckoutState state) {
            if (state is CheckoutLoding) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: Colors.red,
                ),
              );
            }
            if (state is CheckoutLoded) {
              if (state.paymentMethodType == PaymentMethodType.razor_pay) {
                return const Text(
                  'Pay with Razorpay',
                  // style: Theme.of(context)
                  //     .textTheme
                  //     .headline4!
                  //     .copyWith(color: Colors.white),
                );
              }
              if (Platform.isAndroid &&
                  state.paymentMethodType == PaymentMethodType.google_pay) {
                return GooglePay(
                  products: state.products!,
                  total: state.total!,
                );
              }
              // if (Platform.isIOS &&
              //     state.paymentMethod == PaymentMethod.apple_pay) {
              //   return ApplePay(
              //     products: state.products!,
              //     total: state.total!,
              //   );
              // }
              else {
                return Container(
                  color: kgreen,
                );
                // return ElevatedButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/payment');
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.black,
                //   ),
                //   child: Text(
                //     'CHOOSE PAYMENT',
                //     // style: Theme.of(context).textTheme.headline3,
                //   ),
                // );
              }
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ],
    );
  }
}
