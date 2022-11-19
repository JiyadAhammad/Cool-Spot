import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

import '../constant/color/colors.dart';
import '../home/home_screen.dart';

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
      titleTextStyle: const TextStyle(
        color: kwhiteText,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      subTitle: 'Browse the menu and order directly from the application',
      subTitleTextStyle: const TextStyle(
        color: kwhiteText,
        fontSize: 22,
        fontWeight: FontWeight.w300,
      ),
      imageUrl: 'assets/images/splashImage.png',
    ),
    Introduction(
      title: 'Delivery',
      titleTextStyle: const TextStyle(
        color: kwhiteText,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      subTitle: 'Your order will be immediately collected and',
      subTitleTextStyle: const TextStyle(
        color: kwhiteText,
        fontSize: 22,
        fontWeight: FontWeight.w300,
      ),
      imageUrl: 'assets/images/Smoothies1.webp',
    ),
    Introduction(
      title: 'Receive Money',
      titleTextStyle: const TextStyle(
        color: kwhiteText,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      subTitle: 'Pick up delivery at your door and enjoy groceries',
      subTitleTextStyle: const TextStyle(
        color: kwhiteText,
        fontSize: 22,
        fontWeight: FontWeight.w300,
      ),
      imageUrl: 'assets/images/mountain dew.webp',
    ),
    Introduction(
      title: 'Finish',
      titleTextStyle: const TextStyle(
        color: kwhiteText,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      subTitle: 'Browse the menu and order directly from the application',
      subTitleTextStyle: const TextStyle(
        color: kwhiteText,
        fontSize: 22,
        fontWeight: FontWeight.w300,
      ),
      imageUrl: 'assets/images/pepsi.jfif',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CupertinoActivityIndicator(
              color: kblackIcon,
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Something Went wrong'),
          );
        } else if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return IntroScreenOnboarding(
            backgroudColor: kblack,
            introductionList: list,
            onTapSkipButton: () {
              Navigator.pushNamed(context, '/login');
            },
          );
        }
      },
    );
  }
}
