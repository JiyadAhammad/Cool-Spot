import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';
import '../../constant/sizedbox/sizedbox.dart';
import '../../widget/login_text_feild.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({
    super.key,
    required this.buttonText,
    required this.bottomText,
    required this.page,
    required this.onPressed,
    this.fText = '',
  });
  final String buttonText;
  final String bottomText;
  final String page;
  final String fText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
            const LoginTextFormField(
              prefixIcon: Icons.person,
              hintText: 'Email/Mobile',
            ),
            const LoginTextFormField(
              prefixIcon: Icons.https,
              hintText: 'Password',
            ),
            TextButton(
              child: Text(
                fText,
                style: const TextStyle(
                  color: kgreen,
                ),
              ),
              onPressed: () {},
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
                Navigator.pushReplacementNamed(context, '/home');
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
    );
  }
}
