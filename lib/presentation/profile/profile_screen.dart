import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../home/widget/custom_nav_bar.dart';
import '../map/widget/texta_form_widget.dart';
import '../widget/login_text_feild.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String routeName = '/profile';
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        children: [
          LoginTextFormField(
            prefixIcon: Icons.person,
            hintText: 'Name',
          ),
          LoginTextFormField(
            prefixIcon: Icons.person,
            hintText: 'Name',
          ),
          LoginTextFormField(
            prefixIcon: Icons.person,
            hintText: 'Name',
          ),
          LoginTextFormField(
            prefixIcon: Icons.person,
            hintText: 'Name',
          ),
          LoginTextFormField(
            prefixIcon: Icons.person,
            hintText: 'Name',
          ),
          LoginTextFormField(
            prefixIcon: Icons.person,
            hintText: 'Name',
          ),
          LoginTextFormField(
            prefixIcon: Icons.person,
            hintText: 'Name',
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
