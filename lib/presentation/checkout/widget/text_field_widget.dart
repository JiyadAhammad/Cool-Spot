import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

class TextFiledWidget extends StatelessWidget {
  const TextFiledWidget({
    super.key,
    required this.suffixIcon,
    required this.onPressed,
    required this.hintText,
  });
  final IconData suffixIcon;
  final Function() onPressed;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kblack,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: GestureDetector(
              onTap: onPressed,
              child: Icon(
                suffixIcon,
                color: kblack,
              ),
            ),
            fillColor: kwhite,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}
