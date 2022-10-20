import 'package:flutter/material.dart';

import '../../domain/home/product_model/product_model.dart';
import '../constant/color/colors.dart';
import '../home/widget/custom_nav_bar.dart';
import '../widget/custom_app_bar.dart';
import '../widget/product_card_widget.dart';

class WhishListScreen extends StatelessWidget {
  const WhishListScreen({super.key});

  static const String routeName = '/whish';
  //<dynamic>
  static Route<WhishListScreen> route() {
    return MaterialPageRoute<WhishListScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WhishListScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          appBarTitle: 'WhishList',
          appBarIcon: Icons.search,
          onPressed: () => Navigator.pushNamed(context, '/whish'),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.75,
        ),
        itemCount: Product.products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCardWidget(
            productItem: Product.products[index],
            widthFactor: 1.05,
            isWhisList: true,
          );
        },
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
