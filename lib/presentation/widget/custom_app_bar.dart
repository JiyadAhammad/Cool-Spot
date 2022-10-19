import 'package:flutter/material.dart';

import '../constant/color/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.appBarTitle,
    required this.appBarIcon,
  });
  final String appBarTitle;
  final IconData appBarIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ktransparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          decoration: const BoxDecoration(
            color: kblack,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
            onPressed: () {
              Navigator.pushNamed(context, '/whish');
            },
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
