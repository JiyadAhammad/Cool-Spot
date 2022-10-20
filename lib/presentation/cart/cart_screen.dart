import 'package:flutter/material.dart';

import '../../domain/home/product_model/product_model.dart';
import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_bootom_bar_widget.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 521,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return CartContainerWidget(
                      product: Product.products[0],
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 2,
                ),
              ),
              PriceDetailsWidget(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const CutomeBottomBarWidget(),
    );
  }
}

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                'SUBTOTAL',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '₹ 80',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          kheight5,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                'Delivery Fee',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '₹ 20',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const StackPriceContainerWidget(text: 'TOTAL', price: '₹ 100')
        ],
      ),
    );
  }
}

class StackPriceContainerWidget extends StatelessWidget {
  const StackPriceContainerWidget({
    super.key,
    required this.text,
    required this.price,
  });

  final String text;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 6,
            // color: kwhite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kwhite,
            ),
            alignment: Alignment.topCenter,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width - 10,
            height: MediaQuery.of(context).size.width / 6 - 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kblack,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      text,
                      style: const TextStyle(
                        color: kwhiteText,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        color: kwhiteText,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
