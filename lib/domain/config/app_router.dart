import 'dart:developer';

import 'package:flutter/material.dart';

import '../../presentation/cart/cart_screen.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/product_info/product_info.dart';
import '../../presentation/product_list/product_list.dart';
import '../../presentation/profile/profile_screen.dart';
import '../../presentation/splash/splash_screen.dart';
import '../home/category_model/category_model.dart';
import '../home/product_model/product_model.dart';

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
      case ProductList.routeName:
        return ProductList.route(category: settings.arguments! as Category);
      case ProductInformation.routeName:
        return ProductInformation.route(
            product: settings.arguments! as Product);
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Error Router'),
        ),
      ),
    );
  }
}
