import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/my_orders/my_orders_bloc.dart';
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
      body: BlocBuilder<MyOrdersBloc, MyOrdersState>(
        builder: (BuildContext context, MyOrdersState state) {
          if (state is MyOrdersLoding) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: kblackIcon,
              ),
            );
          }
          if (state is MyOrderLoded) {
            return ListView.builder(
              itemCount: state.myOrders.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductDetailsWidget(
                  index: index,
                );
              },
            );
          } else {
            return const Center(
              child: Text('Something Went Wrong'),
            );
          }
        },
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
