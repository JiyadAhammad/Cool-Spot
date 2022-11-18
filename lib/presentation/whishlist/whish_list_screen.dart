import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../application/whislist/whislist_bloc.dart';
import '../../domain/product_model/product_model.dart';
import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
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
      appBar: CustomAppBar(
        leadingOnPressed: () => Navigator.pop(context),
        appBarTitle: 'WhishList',
        appBarIcon: Icons.search,
        onPressed: () => Navigator.pushNamed(context, '/whish'),
      ),
      body: BlocBuilder<WhislistBloc, WhislistState>(
        builder: (BuildContext context, WhislistState state) {
          if (state is WhislistLoding) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: kblackIcon,
              ),
            );
          }
          if (state is WhislistLoded) {
            return state.whishList.product.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Lottie.asset('assets/lottie/emptyfile.json'),
                        const Text(
                          'WhishList is Empty',
                        ),
                        kheight,
                        // const Text(
                        //   'Click + Add Items',
                        // ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 16.0,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.75,
                    ),
                    // itemCount: Product.products.length,
                    itemCount: state.whishList.product.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCardWidget(
                        productItem: state.whishList.product[index],
                        widthFactor: 1.05,
                        isWhisList: true,
                      );
                    },
                  );
          } else {
            return const Center(
              child: Text(
                'Something Went Wrong',
              ),
            );
          }
        },
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
