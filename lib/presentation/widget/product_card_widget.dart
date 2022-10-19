import 'package:flutter/material.dart';

import '../../domain/home/product_model/product_model.dart';
import '../constant/color/colors.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.productItem,
    this.widthFactor = 2.5,
    this.isWhisList = false,
  });

  final Product productItem;
  final double widthFactor;
  final bool isWhisList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/pinfo',
          arguments: productItem,
        );
      },
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.width / 2.3,
            width: MediaQuery.of(context).size.width / widthFactor,
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
            // top: 140,
            top: MediaQuery.of(context).size.width / 2.7,
            child: Container(
              padding: const EdgeInsets.all(5),
              height: MediaQuery.of(context).size.width / 6.9,
              width: MediaQuery.of(context).size.width / widthFactor,
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
                          '₹ ${productItem.productPrice}',
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
                  if (isWhisList)
                    Expanded(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          size: 25,
                          color: kwhiteIcon,
                        ),
                      ),
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
