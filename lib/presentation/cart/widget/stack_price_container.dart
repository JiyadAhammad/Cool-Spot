import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

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
