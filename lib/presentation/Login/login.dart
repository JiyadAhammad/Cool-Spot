import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../home/home_screen.dart';
import 'widget/login_page_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';
  static Route<LoginScreen> route() {
    return MaterialPageRoute<LoginScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: StreamBuilder<User?>(
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
            return LoginPageWidget(
              fText: 'ForgetPasword ?',
              ftextOnpressed: () => Navigator.pushNamed(context, '/forget'),
              buttonText: 'Login',
              bottomText: "Don't Have an Account?",
              page: 'Signup',
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
            );
          }
        },
      ),
    );
  }
}
