import 'package:flutter/material.dart';

import '../../domain/home/category_model/category_model.dart';
import '../../domain/home/product_model/product_model.dart';
import '../home/widget/custom_nav_bar.dart';
import '../widget/custom_app_bar.dart';
import '../widget/product_card_widget.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.category,
  });
  final Category category;

  static const String routeName = '/product';
  static Route<dynamic> route({required Category category}) {
    return MaterialPageRoute<dynamic>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductList(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> productList = Product.products
        .where((Product item) => item.category == category.name)
        .toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          leadingOnPressed: () => Navigator.pop(context),
          appBarIcon: Icons.search,
          appBarTitle: category.name,
          onPressed: () {},
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
        ),
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCardWidget(
            productItem: productList[index],
            widthFactor: 2.2,
          );
        },
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
