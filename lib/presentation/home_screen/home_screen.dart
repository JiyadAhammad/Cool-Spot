import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
