import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';
import '../../constant/sizedbox/sizedbox.dart';
import '../../home/widget/custom_nav_bar.dart';
import '../../widget/login_text_feild.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  static const String routeName = '/pedit';
  static Route<EditProfileScreen> route() {
    return MaterialPageRoute<EditProfileScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const EditProfileScreen(),
    );
  }

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
          const LoginTextFormField(
            prefixIcon: Icons.person,
            hintText: 'Name',
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
