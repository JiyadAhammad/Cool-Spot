import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import 'elevated_button_widget.dart';

class CutomeBottomBarWidget extends StatelessWidget {
  const CutomeBottomBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      color: kblack,
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 90,
            vertical: 5,
          ),
          child: ElevatedButtonWidget(
            content: 'Checkout',
          ),
        ),
      ),
    );
  }
}
