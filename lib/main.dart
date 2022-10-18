import 'package:flutter/material.dart';

import 'domain/config/app_router.dart';
import 'domain/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: '/home',
      // home: const SplashScreen(),
    );
  }
}
