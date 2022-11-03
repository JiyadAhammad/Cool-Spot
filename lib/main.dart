import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/cart/cart_bloc.dart';
import 'domain/config/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<Bloc<dynamic, dynamic>>>[
        BlocProvider<CartBloc>(
          create: (_) => CartBloc()
            ..add(
              LoadCart(),
            ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery',
        theme: ThemeData(primarySwatch: Colors.cyan),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: '/',
        // home: const SplashScreen(),
      ),
    );
  }
}
