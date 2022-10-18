import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

class HomeSectionwidget extends StatelessWidget {
  const HomeSectionwidget({
    super.key,
    required this.sectionTitle,
  });
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          sectionTitle,
          style: const TextStyle(
            color: kblackText,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Avenir',
          ),
        ),
      ),
    );
  }
}