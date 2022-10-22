import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/login_text_feild.dart';

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
      body: LoginPageWidget(
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

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({
    super.key,
    required this.buttonText,
    required this.bottomText,
    required this.page,
    required this.onPressed,
  });
  final String buttonText;
  final String bottomText;
  final String page;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width / 3,
          left: 5,
          right: 5,
        ),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset('assets/images/login.png'),
              ],
            ),
            Column(
              children: <Widget>[
                const LoginTextFormField(
                  prefixIcon: Icons.person,
                  hintText: 'Email/Mobile',
                ),
                kheight5,
                const LoginTextFormField(
                  prefixIcon: Icons.https,
                  hintText: 'Password',
                ),
                kheight,
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text(
                    buttonText,
                  ),
                ),
                kheight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/images/facebook.png'),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/images/google.png'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(bottomText),
                    TextButton(
                      onPressed: onPressed,
                      child: Text(
                        page,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
