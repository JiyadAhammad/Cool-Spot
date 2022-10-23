import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

import '../constant/color/colors.dart';

class IntroductionScreen extends StatelessWidget {
  IntroductionScreen({super.key});

  static const String routeName = '/intro';
  static Route<IntroductionScreen> route() {
    return MaterialPageRoute<IntroductionScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => IntroductionScreen(),
    );
  }

  final List<Introduction> list = <Introduction>[
    Introduction(
      title: 'Buy & Sell',
      titleTextStyle: TextStyle(
        color: kwhiteText,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      subTitle: 'Browse the menu and order directly from the application',
      subTitleTextStyle: TextStyle(
        color: kwhiteText,
        fontSize: 22,
        fontWeight: FontWeight.w300,
      ),
      imageUrl: 'assets/images/splashImage.png',
    ),
    Introduction(
      title: 'Delivery',
      titleTextStyle: TextStyle(
        color: kwhiteText,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      subTitle: 'Your order will be immediately collected and',
      subTitleTextStyle: TextStyle(
        color: kwhiteText,
        fontSize: 22,
        fontWeight: FontWeight.w300,
      ),
      imageUrl: 'assets/images/Smoothies1.webp',
    ),
    Introduction(
      title: 'Receive Money',
      titleTextStyle: TextStyle(
        color: kwhiteText,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      subTitle: 'Pick up delivery at your door and enjoy groceries',
      subTitleTextStyle: TextStyle(
        color: kwhiteText,
        fontSize: 22,
        fontWeight: FontWeight.w300,
      ),
      imageUrl: 'assets/images/mountain dew.webp',
    ),
    Introduction(
      title: 'Finish',
      titleTextStyle: TextStyle(
        color: kwhiteText,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      subTitle: 'Browse the menu and order directly from the application',
      subTitleTextStyle: TextStyle(
        color: kwhiteText,
        fontSize: 22,
        fontWeight: FontWeight.w300,
      ),
      imageUrl: 'assets/images/pepsi.jfif',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: kblack,
      introductionList: list,
      onTapSkipButton: () {
        Navigator.pushNamed(context, '/login');
      },
    );
  }
}
