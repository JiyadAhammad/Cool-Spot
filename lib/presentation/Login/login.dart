import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import 'widget/login_page_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const String routeName = '/login';
  static Route<LoginScreen> route() {
    return MaterialPageRoute<LoginScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => LoginScreen(),
    );
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: LoginPageWidget(
        fText: 'ForgetPasword ?',
        ftextOnpressed: () => Navigator.pushNamed(context, '/forget'),
        buttonText: 'Login',
        bottomText: "Don't Have an Account?",
        page: 'Signup',
        onPressed: () {
          Navigator.pushNamed(context, '/signup');
        },
      ),
    );
  }
}
