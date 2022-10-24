import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_bootom_bar_widget.dart';
import 'widget/delivery_container.dart';

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
