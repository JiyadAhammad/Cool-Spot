import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';
import '../../constant/sizedbox/sizedbox.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kwhite,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 40,
                child: Image(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
              kwidth,
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
