import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          appBarTitle: 'Payment',
          appBarIcon: Icons.money,
          onPressed: () {},
        ),
      ),
    );
  }
}
