import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.date,
    required this.iconData,
    required this.onPressed,
    this.color = kblack,
    this.whiteicon = kwhiteIcon,
    this.textwhite = kwhiteText,
  });
  final String date;
  final IconData iconData;
  final Function() onPressed;
  final Color color;
  final Color whiteicon;
  final Color textwhite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/payment');
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  date,
                  style: TextStyle(
                    color: textwhite,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Spacer(),
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  iconData,
                ),
                color: whiteicon,
              )
            ],
          ),
        ),
      ),
    );
  }
}
