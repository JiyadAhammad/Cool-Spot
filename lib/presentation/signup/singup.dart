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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Form(
        child: ListView(
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
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'please Enter your Email';
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'please Enter Valid Email';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    emailControll.text = value!;
                  },
                ),
                LoginTextFormField(
                  controller: paswordControll,
                  prefixIcon: Icons.https,
                  hintText: 'Password',
                  visble: true,
                  validator: (String? value) {
                    // final RegExp regExp = RegExp(r'/^.{6,}$/');
                    if (value!.isEmpty) {
                      return 'please Enter your Password';
                    }
                    // if (!regExp.hasMatch(value)) {
                    //   return 'please Enter Valid Password(min 6 char)';
                    // }
                  },
                  onSaved: (String? value) {
                    paswordControll.text = value!;
                  },
                ),
                LoginTextFormField(
                  controller: confirmPswrdControll,
                  prefixIcon: Icons.vpn_key,
                  hintText: 'Confirm Password',
                  visble: true,
                  validator: (String? value) {
                    if (paswordControll.text != value) {
                      return "Password Don't match";
                    } else {
                      return null;
                    }
                  },
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
                  onPressed: () {},
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

  Future<void> singnUp(
    String email,
    String password,
  ) async {
    if (formKey.currentState!.validate()) {}
  }
}
