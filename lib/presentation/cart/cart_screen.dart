import 'package:flutter/material.dart';

import '../../domain/cart/cart_model/cart_model.dart';
import '../constant/color/colors.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_bootom_bar_widget.dart';
import '../widget/price_details_widget.dart';
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
          leadingOnPressed: () {
            Navigator.pop(context);
          },
          appBarTitle: 'Cool Cart',
          appBarIcon: Icons.add_circle,
          onPressed: () => Navigator.pushNamed(context, '/whish'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.width / .90,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: Cart().items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CartContainerWidget(
                      product: Cart().items[index],
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  Cart().freeDelivey,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 2,
                ),
              ),
              const PriceDetailsWidget(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CutomeBottomBarWidget(
          text: 'Checkout',
          onPressed: () {
            Navigator.pushNamed(context, '/checkout');
          }),
    );
  }
}
