import 'package:flutter/material.dart';

import '../constant/color/colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  static const String routeName = '/singup';
  static Route<SignupScreen> route() {
    return MaterialPageRoute<SignupScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SignupScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
