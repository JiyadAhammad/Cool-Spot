import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/login_text_feild.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  static const String routeName = '/signup';
  static Route<SignupScreen> route() {
    return MaterialPageRoute<SignupScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SignupScreen(),
    );
  }

  final TextEditingController emailControll = TextEditingController();
  final TextEditingController paswordControll = TextEditingController();
  final TextEditingController confirmPswrdControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width / 4,
          horizontal: 10,
        ),
        shrinkWrap: true,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset('assets/images/login.png'),
            ],
          ),
          Column(
            children: <Widget>[
              LoginTextFormField(
                controller: emailControll,
                prefixIcon: Icons.person,
                hintText: 'Email/Mobile',
                validator: (p0) {},
              ),
              LoginTextFormField(
                controller: paswordControll,
                prefixIcon: Icons.https,
                hintText: 'Password',
                visble: true,
                validator: (p0) {},
              ),
              LoginTextFormField(
                controller: confirmPswrdControll,
                prefixIcon: Icons.vpn_key,
                hintText: 'Confirm Password',
                visble: true,
                validator: (p0) {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kblack,
                  minimumSize: Size(
                    MediaQuery.of(context).size.width / 1.5,
                    50,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: singnUp,
                // onPressed: () {
                //   // Navigator.pushReplacementNamed(context, '/home')/;
                // },
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    color: kwhiteText,
                    fontSize: 20,
                  ),
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
              kheight,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Alredy Have an Account?'),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: const Text(
                      'Sign In',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      // body: LoginPageWidget(
      //   ftextOnpressed: () {},
      //   buttonText: 'Signup',
      //   bottomText: 'Alredy Have an Account?',
      //   page: 'Login',
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/login');
      //   },
      // ),
    );
  }

  Future<void> singnUp() async {
    //   try {
    //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //       email: email,
    //       password: password,
    //     );
    //   } catch (e) {}
  }
}
