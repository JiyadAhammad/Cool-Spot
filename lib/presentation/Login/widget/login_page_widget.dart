import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constant/color/colors.dart';
import '../../constant/sizedbox/sizedbox.dart';
import '../../widget/login_text_feild.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
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

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final TextEditingController emailLController = TextEditingController();

  final TextEditingController pswrdLController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );
  GoogleSignInAccount? currentUser;
  @override
  void initState() {
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        currentUser = account;
      });
    });
    googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GoogleSignInAccount? user = currentUser;
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
                onPressed: widget.ftextOnpressed,
                child: Text(
                  widget.fText,
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
                  widget.buttonText,
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
                  InkWell(
                    onTap: () {
                      googleSingIN(user);
                    },
                    child: Image.asset('assets/images/google.png'),
                  ),
                ],
              ),
              kheight,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.bottomText),
                  TextButton(
                    onPressed: widget.onPressed,
                    child: Text(
                      widget.page,
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
      }).catchError(
        (dynamic error) {
          Fluttertoast.showToast(
            msg: error!.toString(),
          );
        },
      );
    }
  }

  Future<void> googleSingIN(GoogleSignInAccount? user) async {
    try {
      final GoogleSignInAccount? userAccount = await googleSignIn.signIn();
      if (googleSignIn == null) {
        return;
      }
      user = userAccount;
      final GoogleSignInAuthentication googleAuth =
          await userAccount!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      log('$e catch Google Signin error');
    }
  }
}
