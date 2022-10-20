import 'package:flutter/material.dart';

import '../constant/color/colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    required this.content,
    super.key,
    required this.onPressed,
  });
  final String content;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll<Color>(kwhite),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        maximumSize: MaterialStateProperty.all(
          const Size(200, 40),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        content,
        style: const TextStyle(
          color: kblackText,
          fontSize: 20,
        ),
      ),
    );
  }
}
