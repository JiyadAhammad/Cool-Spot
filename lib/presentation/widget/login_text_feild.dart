import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    this.visble = false,
    required this.validator,
    this.onSaved,
  });
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final bool visble;
  final String? Function(String?) validator;
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        controller: controller,
        obscureText: visble,
        style: const TextStyle(
          fontSize: 24,
          color: kblack,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          focusColor: kwhite,
          prefixIcon: Icon(
            prefixIcon,
            color: kbluegrey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              width: 3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: kbluegrey,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: kbluegrey,
            fontSize: 16,
            fontFamily: 'verdana_regular',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
