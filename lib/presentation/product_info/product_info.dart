import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/bloc/cart/cart_bloc.dart';
import '../../application/bloc/whislist/whislist_bloc.dart';
import '../../domain/product_model/product_model.dart';
import '../constant/color/colors.dart';
import '../widget/custom_app_bar.dart';
import '../widget/elevated_button_widget.dart';
import '../widget/stack_contaien.dart';
import 'widget/expanded_tile_widget.dart';

class ProductInformation extends StatelessWidget {
  const ProductInformation({
    super.key,
    required this.product,
  });

  static const String routeName = '/pinfo';
  static Route<ProductInformation> route({required Product product}) {
    return MaterialPageRoute<ProductInformation>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductInformation(
        product: product,
      ),
    );
  }

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingOnPressed: () => Navigator.pop(context),
        appBarTitle: product.productName,
        appBarIcon: Icons.favorite,
        onPressed: () => Navigator.pushNamed(context, '/whish'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: <Widget>[
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.width / 1.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              StackContainerWidget(product: product),
              ExpandedTileWidget(
                title: 'PRODUCT INFORMATION',
                subTitle:
                    '''Category : ${product.category} \n\nName : ${product.productName}\n\nPrice : ${product.productPrice} \n\nRecommended : ${product.isrecommended} \n\nPopular : ${product.ispopular} \n\nDescription : ${product.description} ''',
              ),
              const ExpandedTileWidget(
                initiallyExpanded: false,
                title: 'DELIVERY INFORMATION',
                subTitle:
                    '''when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages''',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: MediaQuery.of(context).size.width / 6,
          width: MediaQuery.of(context).size.width,
          color: kblack,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  log('$product this is product');
                },
                icon: const Icon(
                  Icons.share,
                  color: kwhiteIcon,
                  size: 30,
                ),
              ),
              BlocBuilder<WhislistBloc, WhislistState>(
                builder: (BuildContext context, WhislistState state) {
                  if (state is WhislistLoding) {
                    return const Center(
                      child: CupertinoActivityIndicator(color: kwhiteIcon),
                    );
                  }
                  if (state is WhislistLoded) {
                    return IconButton(
                      onPressed: () {
                        log('$product this is product');
                        const SnackBar snackBar = SnackBar(
                          content: Text(
                            'Added to Whishlist',
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        context.read<WhislistBloc>().add(
                              AddtoWishList(product),
                            );
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: kwhiteIcon,
                        size: 30,
                      ),
                    );
                  } else {
                    return const Text('data');
                  }
                },
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (BuildContext context, CartState state) {
                  return ElevatedButtonWidget(
                    content: 'Add to Cart',
                    onPressed: () {
                      context.read<CartBloc>().add(
                            CartProductAdded(product),
                          );
                      Navigator.pushNamed(context, '/cart');
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
