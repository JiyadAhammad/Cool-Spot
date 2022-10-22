import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_bootom_bar_widget.dart';
import 'widget/payment_method.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          leadingOnPressed: () => Navigator.pop(context),
          appBarTitle: 'Payment',
          appBarIcon: Icons.money,
          onPressed: () {},
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: CashOnDeliveryContainer(),
      ),
      bottomNavigationBar: CutomeBottomBarWidget(
        text: 'Pay',
        onPressed: () {
          Navigator.pushNamed(context, '/confirm');
        },
      ),
    );
  }
}

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
