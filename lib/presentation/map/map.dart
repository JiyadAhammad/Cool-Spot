import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  static const String routeName = '/payment';
  static Route<LocationScreen> route() {
    return MaterialPageRoute<LocationScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LocationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(),
        ],
      ),
    );
  }
}
