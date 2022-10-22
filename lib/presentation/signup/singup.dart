import 'package:flutter/material.dart';

import '../Login/widget/login_page_widget.dart';
import '../constant/color/colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  static const String routeName = '/signup';
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
      body: LoginPageWidget(
        buttonText: 'Signup',
        bottomText: 'Alredy Have an Account?',
        page: 'Login',
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
      ),
    );
  }
}
