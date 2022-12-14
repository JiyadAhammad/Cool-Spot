import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../domain/usermodel/user_model.dart';
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

  final TextEditingController nameControll = TextEditingController();
  final TextEditingController phoneControll = TextEditingController();
  final TextEditingController emailControll = TextEditingController();
  final TextEditingController paswordControll = TextEditingController();
  final TextEditingController confirmPswrdControll = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width / 4,
            horizontal: 10,
          ),
          shrinkWrap: true,
          children: <Widget>[
            // Column(
            //   children: <Widget>[
            //     Image.asset('assets/images/login.png'),
            //   ],
            // ),
            LoginTextFormField(
              prefixIcon: Icons.person,
              hintText: 'Enter your name',
              controller: nameControll,
              validator: (String? value) {
                //^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$

                if (value!.isEmpty) {
                  return 'please Enter your Number';
                }

                return null;
              },
            ),
            LoginTextFormField(
              prefixIcon: Icons.phone_android_outlined,
              hintText: 'Enter your Number',
              controller: phoneControll,
              keyboardType: TextInputType.number,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'please Enter your Number';
                }
                if (!RegExp(r'(^(?:[+0]9)?[0-9]{10}$)').hasMatch(value)) {
                  return 'Number Must be 10 didgit';
                }
                return null;
              },
            ),
            Column(
              children: <Widget>[
                LoginTextFormField(
                  controller: emailControll,
                  prefixIcon: Icons.email,
                  hintText: 'Email',
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
                    if (value!.isEmpty) {
                      return 'please Enter your Password';
                    }
                    return null;
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
                  onSaved: (String? p0) {
                    confirmPswrdControll.text = p0!;
                  },
                ),
                kheight,
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
                    singnUp(
                      emailControll.text,
                      paswordControll.text,
                      context,
                    );
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: kwhiteText,
                      fontSize: 20,
                    ),
                  ),
                ),
                kheight20,
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
    );
  }

  Future<void> singnUp(
    String email,
    String password,
    BuildContext context,
  ) async {
    if (formKey.currentState!.validate()) {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((UserCredential value) {
        addCreditianlToFirebase(context);
      }).catchError(
        (dynamic onError) {
          Fluttertoast.showToast(
            msg: onError.toString(),
          );
        },
      );
    }
  }

  Future<void> addCreditianlToFirebase(BuildContext context) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final User? user = auth.currentUser;

    final UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameControll.text.trim();
    userModel.pNumber = phoneControll.text.trim();
    await firebaseFirestore.collection('user').doc(user.uid).set(
          userModel.toDocumet(),
        );
    Fluttertoast.showToast(
      msg: 'Account Created Successfully',
    );
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home');
  }
}
