import 'package:flutter/material.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    this.visble = false,
    required this.validator,
  });
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final bool visble;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: visble,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          focusColor: Colors.white,
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.grey,
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
          fillColor: Colors.grey,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: 'verdana_regular',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
