import 'package:flutter/material.dart';

import '../constant/color/colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    required this.content,
    super.key,
  });
  final String content;

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
        minimumSize: MaterialStateProperty.all(
          const Size(180, 40),
        ),
      ),
      onPressed: () {},
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
