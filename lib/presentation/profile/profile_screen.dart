import 'package:flutter/material.dart';

import '../checkout/checkout_screen.dart';
import '../checkout/widget/container_widget.dart';
import '../constant/color/colors.dart';
import '../home/widget/custom_nav_bar.dart';
import '../widget/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String routeName = '/profile';
  static Route<ProfileScreen> route() {
    return MaterialPageRoute<ProfileScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(
        appBarTitle: 'Profile',
        appBarIcon: Icons.edit,
        onPressed: () {
          Navigator.pushNamed(context, '/pedit');
        },
        leadingOnPressed: () {
          Navigator.pushNamed(context, '/home');
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          // vertical: 20,
          horizontal: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage(
                  'assets/images/google.png',
                ),
              ),
            ),
            ContainerWidget(
              color: kwhite,
              date: 'Name',
              textwhite: kblackText,
              iconData: Icons.edit,
              whiteicon: kblackIcon,
              onPressed: () {},
            ),
            ContainerWidget(
              color: kwhite,
              date: 'Email',
              textwhite: kblackText,
              iconData: Icons.edit,
              whiteicon: kblackIcon,
              onPressed: () {},
            ),
            ContainerWidget(
              color: kwhite,
              date: 'Number',
              textwhite: kblackText,
              iconData: Icons.edit,
              whiteicon: kblackIcon,
              onPressed: () {},
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
