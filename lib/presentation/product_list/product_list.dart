import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/product/product_bloc.dart';
import '../../domain/category_model/category_model.dart';
import '../../domain/product_model/product_model.dart';
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
  static Route<ProductList> route({required Category category}) {
    return MaterialPageRoute<ProductList>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductList(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final List<Product> productList = Product.products
    //     .where((Product item) => item.category == category.name)
    //     .toList();
    return Scaffold(
      appBar: CustomAppBar(
        leadingOnPressed: () => Navigator.pop(context),
        appBarIcon: Icons.search,
        appBarTitle: category.name,
        onPressed: () {},
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (BuildContext context, ProductState state) {
          if (state is ProductLoding) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is ProductLoded) {
            final List<Product> productList = state.products
                .where((Product item) => item.category == category.name)
                .toList();
            // log('$productList');

            return productList.isEmpty
                ? const Center(
                    child: Text(
                      'NO Item Found',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 16.0,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                  );
          } else {
            return const Text('Something went Wrong');
          }
        },
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
