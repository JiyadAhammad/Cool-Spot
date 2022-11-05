import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constant/color/colors.dart';
import '../../constant/sizedbox/sizedbox.dart';
import '../../widget/login_text_feild.dart';

class LoginPageWidget extends StatelessWidget {
  LoginPageWidget({
    super.key,
    required this.buttonText,
    required this.bottomText,
    required this.page,
    required this.onPressed,
    this.fText = '',
    required this.ftextOnpressed,
  });
  final String buttonText;
  final String bottomText;
  final Function() ftextOnpressed;
  final String page;
  final String fText;
  final Function() onPressed;

  final TextEditingController emailLController = TextEditingController();
  final TextEditingController pswrdLController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width / 3,
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
                controller: emailLController,
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
                  emailLController.text = value!;
                },
              ),
              LoginTextFormField(
                controller: pswrdLController,
                prefixIcon: Icons.https,
                hintText: 'Password',
                visble: true,
                validator: (String? value) {
                  // final RegExp regExp = RegExp(r'/^.{6,}$/');
                  if (value!.isEmpty) {
                    return 'please Enter your Password';
                  }
                  return null;
                  // if (!regExp.hasMatch(value)) {
                  //   return 'please Enter Valid Password(min 6 char)';
                  // }
                },
                onSaved: (String? value) {
                  pswrdLController.text = value!;
                },
              ),
              TextButton(
                onPressed: ftextOnpressed,
                child: Text(
                  fText,
                  style: const TextStyle(
                    color: kgreen,
                  ),
                ),
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
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, '/home');
                  singIn(
                    emailLController.text,
                    pswrdLController.text,
                    context,
                  );
                },
                child: Text(
                  buttonText,
                  style: const TextStyle(
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
    );
  }

  Future<void> singIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    if (formKey.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((UserCredential value) {
        Fluttertoast.showToast(msg: 'Login Successfull');
        Navigator.pushReplacementNamed(context, '/home');
      }).catchError((error) {
        Fluttertoast.showToast(
          msg: error!.toString(),
        );
      });
    }
  }
}
