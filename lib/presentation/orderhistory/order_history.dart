import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../home/widget/custom_nav_bar.dart';
import '../widget/custom_app_bar.dart';
import 'widget/product_widget.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  static const String routeName = '/myorders';
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
        appBarTitle: 'My Orders',
        appBarIcon: Icons.favorite,
        onPressed: () => Navigator.pushNamed(context, '/whish'),
        leadingOnPressed: () => Navigator.pop(context),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return ProductDetailsWidget(
            index: index,
          );
        },
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
