import 'dart:developer';

import 'package:flutter/material.dart';

import '../../presentation/cart_screen/cart_screen.dart';
import '../../presentation/home_screen/home_screen.dart';
import '../../presentation/profile_screen/profile_screen.dart';
import '../../presentation/splash_screen/splash_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    log('this the route ${settings.name}');

    switch (settings.name) {
      case '/':
        return SplashScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => const Scaffold(
        body: Text('Error Router'),
      ),
    );
  }
}
