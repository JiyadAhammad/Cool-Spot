import 'package:flutter/material.dart';

import '../../domain/home/product_model/product_model.dart';
import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/custom_app_bar.dart';
import '../widget/elevated_button_widget.dart';

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
      body: const CartContainerWidget(),
      bottomNavigationBar: const CutomeBottomBarWidget(),
    );
  }
}

class CartContainerWidget extends StatelessWidget {
  const CartContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 10,
        ),
        child: Container(
          height: MediaQuery.of(context).size.width / 4,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: kwhite,
          ),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Image.network(
                  Product.products[0].imageUrl,
                  fit: BoxFit.fitHeight,
                  width: 110,
                  height: 120,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Product.products[3].productName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        color: kblackText,
                      ),
                    ),
                    kheight5,
                    Text(
                      Product.products[0].productPrice.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: kbluegrey,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_circle,
                  ),
                ),
              ),
              const Text('2'),
              Expanded(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CutomeBottomBarWidget extends StatelessWidget {
  const CutomeBottomBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      color: kblack,
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 90,
            vertical: 5,
          ),
          child: ElevatedButtonWidget(
            content: 'Checkout',
          ),
        ),
      ),
    );
  }
}
