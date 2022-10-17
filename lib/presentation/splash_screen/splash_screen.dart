import 'package:flutter/material.dart';

import '../constant/color/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/splashImage.png'),
          const Center(
            child: Text('Drink Socially'),
          ),
        ],
      ),
    );
  }
}
