import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../application/cart/cart_bloc.dart';
import '../../application/product/product_bloc.dart';
import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_bootom_bar_widget.dart';
import '../widget/price_details_widget.dart';
import 'widget/cart_container_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const String routeName = '/cart';
  static Route<CartScreen> route() {
    return MaterialPageRoute<CartScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(
        leadingOnPressed: () {
          Navigator.pop(context);
        },
        appBarTitle: 'Cool Cart',
        appBarIcon: Icons.add_circle,
        onPressed: () => Navigator.pushNamed(context, '/whish'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (BuildContext context, CartState state) {
          if (state is CartLoading) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: kwhite,
              ),
            );
          }
          if (state is CartLoaded) {
            final Map<dynamic, dynamic> cartItem =
                state.cart.productQuantity(state.cart.product);

            return cartItem.keys.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Lottie.asset('assets/lottie/emptyfile.json'),
                        const Text(
                          'Cart is Still Empty ',
                        ),
                        kheight,
                        const Text(
                          'Add More Items',
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.width / .750,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: cartItem.keys.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CartContainerWidget(
                                    product: cartItem.keys.elementAt(index),
                                    quantity: cartItem.values.elementAt(index),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                state.cart.freeDelivey,
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
                  );
          } else {
            return const Center(
              child: Text('Something Error'),
            );
          }
        },
      ),
      // bottomNavigationBar: const GoToCheckoutNavBar(),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (BuildContext context, CartState state) {
          if (state is CartLoaded) {
            final Map<dynamic, dynamic> cartItem =
                state.cart.productQuantity(state.cart.product);
            return CutomeBottomBarWidget(
              text: 'Checkout',
              onPressed: () {
                if (cartItem.keys.isEmpty) {
                  const SnackBar snackdemo = SnackBar(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    content: Text('No Item in Cart'),
                    backgroundColor: kblackText,
                    elevation: 10,
                    width: 200,
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 3),
                    padding: EdgeInsets.all(20),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                } else {
                  Navigator.pushNamed(context, '/checkout');
                }
              },
            );
          }
          if (state is ProductLoding) {
            return const CupertinoActivityIndicator();
          } else {
            return const Text('Something Went Wrong');
          }
        },
      ),
    );
  }
}

class GoToCheckoutNavBar extends StatelessWidget {
  const GoToCheckoutNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/checkout');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kblack,
            shape: const RoundedRectangleBorder(),
          ),
          child: const Text(
            'GO TO CHECKOUT',
            style: TextStyle(
              color: kwhiteText,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
