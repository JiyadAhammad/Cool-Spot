import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';
import '../../constant/sizedbox/sizedbox.dart';
import '../../home/widget/custom_nav_bar.dart';
import '../../widget/login_text_feild.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  static const String routeName = '/pedit';
  static Route<EditProfileScreen> route() {
    return MaterialPageRoute<EditProfileScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => EditProfileScreen(),
    );
  }

  final TextEditingController emailControll = TextEditingController();
  final TextEditingController nameControll = TextEditingController();
  final TextEditingController numberControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.width / 1.5,
            child: Stack(
              // clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: <Widget>[
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/splashImage.png',
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: MediaQuery.of(context).size.width / 7,
                  child: RawMaterialButton(
                    onPressed: () {},
                    fillColor: const Color(0xFFF5F6F9),
                    padding: const EdgeInsets.all(15.0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          kheight20,
          LoginTextFormField(
            controller: nameControll,
            prefixIcon: Icons.person,
            hintText: 'Name',
            validator: (String? p0) {
              return null;
            },
          ),
          LoginTextFormField(
            controller: emailControll,
            prefixIcon: Icons.mail,
            hintText: 'Email',
            validator: (String? p0) {
              return null;
            },
          ),
          LoginTextFormField(
            controller: numberControll,
            prefixIcon: Icons.mobile_friendly,
            hintText: 'Number',
            validator: (String? p0) {
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 10,
            ),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                minimumSize: const Size(0, 50),
                backgroundColor: kblack,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              label: const Text(
                'Save',
                style: TextStyle(
                  color: kwhiteText,
                ),
              ),
              icon: const Icon(
                Icons.check,
                color: kwhiteIcon,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
