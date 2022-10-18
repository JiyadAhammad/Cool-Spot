import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: kblack,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: const Icon(
                Icons.home,
                color: kwhite,
                size: 35,
              ),
              label: const Text(
                'Home',
                style: TextStyle(
                  color: kwhiteText,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: kwhite,
                size: 35,
              ),
              label: const Text(
                'Cart',
                style: TextStyle(
                  color: kwhiteText,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: const Icon(
                Icons.person,
                color: kwhite,
                size: 35,
              ),
              label: const Text(
                'Profile',
                style: TextStyle(
                  color: kwhiteText,
                ),
              ),
            ),
            // IconButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/home');
            //   },
            //   icon: const Icon(
            //     Icons.home,
            //     color: kwhite,
            //     size: 35,
            //   ),
            // ),
            // IconButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/cart');
            //   },
            //   icon: const Icon(
            //     Icons.shopping_cart,
            //     color: kwhite,
            //     size: 35,
            //   ),
            // ),
            // IconButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/profile');
            //   },
            //   icon: const Icon(
            //     Icons.person,
            //     color: kwhite,
            //     size: 35,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
