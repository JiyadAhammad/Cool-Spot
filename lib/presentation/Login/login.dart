import 'package:flutter/material.dart';

import '../constant/color/colors.dart';

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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/login.png'),
            const LoginTextFormField(),
            const LoginTextFormField(),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Login',
              ),
            ),
            const Text('data'),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Signup',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: TextFormField(
        // controller: userInput,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          focusColor: Colors.white,
          //add prefix icon
          prefixIcon: const Icon(
            Icons.person_outline_rounded,
            color: Colors.grey,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 3,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,

          hintText: 'Email/Mobile',

          //make hint text
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: 'verdana_regular',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
