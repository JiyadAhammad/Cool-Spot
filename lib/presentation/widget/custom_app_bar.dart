import 'package:flutter/material.dart';

import '../constant/color/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.appBarTitle,
    required this.appBarIcon,
    required this.onPressed,
    this.icon = Icons.arrow_back_ios,
    required this.leadingOnPressed,
  });
  final String appBarTitle;
  final IconData appBarIcon;
  final Function() onPressed;
  final IconData icon;
  final Function() leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ktransparent,
      leading: IconButton(
        onPressed: leadingOnPressed,
        icon: Icon(
          icon,
          color: kblackIcon,
          size: 30,
        ),
      ),
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          decoration: const BoxDecoration(
            color: kblack,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Text(
              appBarTitle,
              style: const TextStyle(
                color: kwhiteText,
                fontSize: 24,
                fontFamily: 'Varela Round',
                fontWeight: FontWeight.w500,
                letterSpacing: 5,
              ),
            ),
          ),
        ),
      ),
      centerTitle: true,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              appBarIcon,
              color: kblackIcon,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}
