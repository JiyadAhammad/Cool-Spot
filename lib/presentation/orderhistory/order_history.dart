import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../widget/custom_app_bar.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  static const String routeName = '/orderhistory';
  static Route<OrderHistory> route() {
    return MaterialPageRoute<OrderHistory>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OrderHistory(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(
        appBarTitle: 'History',
        appBarIcon: Icons.favorite,
        onPressed: () => Navigator.pushNamed(context, '/whish'),
        leadingOnPressed: () => Navigator.pop(context),
      ),
    );
  }
}
