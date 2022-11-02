import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/cart/cart_bloc.dart';
import '../../../domain/product_model/product_model.dart';
import '../../constant/color/colors.dart';
import '../../constant/sizedbox/sizedbox.dart';

class CartContainerWidget extends StatelessWidget {
  const CartContainerWidget({
    super.key,
    required this.product,
    this.quantity,
  });

  final product;
  final quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
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
                product.imageUrl.toString(),
                fit: BoxFit.fitHeight,
                width: 110,
                height: 120,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.productName.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        color: kblackText,
                      ),
                    ),
                    kheight5,
                    Text(
                      '₹ ${product.productPrice}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: kgreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<CartBloc, CartState>(
              builder: (BuildContext context, CartState state) {
                return Row(
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context.read<CartBloc>().add(
                              RemoveCartProduct(product as Product),
                            );
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        size: 30,
                      ),
                    ),
                    Text(
                      '$quantity',
                      style: const TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context.read<CartBloc>().add(
                              CartProductAdded(product as Product),
                            );
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        size: 30,
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
