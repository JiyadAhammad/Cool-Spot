import 'dart:developer';
import 'package:flutter/material.dart';

import '../../presentation/Confirm/order_confirm_screen.dart';
import '../../presentation/Login/login.dart';
import '../../presentation/cart/cart_screen.dart';
import '../../presentation/checkout/checkout_screen.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/map/map.dart';
import '../../presentation/payment/payment_screen.dart';
import '../../presentation/product_info/product_info.dart';
import '../../presentation/product_list/product_list.dart';
import '../../presentation/profile/profile_screen.dart';
import '../../presentation/signup/singup.dart';
import '../../presentation/splash/splash_screen.dart';
import '../../presentation/whishlist/whish_list_screen.dart';
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
      case WhishListScreen.routeName:
        return WhishListScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case PaymentScreen.routeName:
        return PaymentScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case OrderConfirmationScreen.routeName:
        return OrderConfirmationScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case SignupScreen.routeName:
        return SignupScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route<Scaffold> _errorRoute() {
    return MaterialPageRoute<Scaffold>(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Error Router'),
        ),
      ),
    );
  }
}
