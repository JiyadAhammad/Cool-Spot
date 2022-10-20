import 'package:flutter/material.dart';

import '../../domain/home/product_model/product_model.dart';
import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_bootom_bar_widget.dart';
import '../widget/elevated_button_widget.dart';
import 'widget/cart_container_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const String routeName = '/cart';
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          appBarTitle: 'Cool Cart',
          appBarIcon: Icons.add_circle,
          onPressed: () => Navigator.pushNamed(context, '/whish'),
        ),
      ),
      body: CartContainerWidget(
        product: Product.products[0],
      ),
      bottomNavigationBar: const CutomeBottomBarWidget(),
    );
  }
}
