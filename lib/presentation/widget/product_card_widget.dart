import 'package:flutter/material.dart';

import '../../domain/home/product_model/product_model.dart';
import '../constant/color/colors.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.productItem,
  });

  final Product productItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.width / 2.3,
          width: MediaQuery.of(context).size.width / 2.5,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            child: Image.network(
              productItem.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 140,
          child: Container(
            padding: const EdgeInsets.all(5),
            height: MediaQuery.of(context).size.width / 6.9,
            width: MediaQuery.of(context).size.width / 2.5,
            // color: kgreen,
            decoration: const BoxDecoration(
              color: kblack,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        productItem.productName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          color: kwhiteText,
                        ),
                      ),
                      Text(
                        (productItem.productPrice).toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: kwhiteText,
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
                      Icons.add_circle_outline,
                      size: 25,
                      color: kwhiteIcon,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
