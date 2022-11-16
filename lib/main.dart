// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'application/cart/cart_bloc.dart';
// import 'application/category/category_bloc.dart';
// import 'application/checkout/checkout_bloc.dart';
// import 'application/payment/payment_method_bloc.dart';
// import 'application/product/product_bloc.dart';
// import 'domain/config/app_router.dart';
// import 'infrastructure/category/category_repository.dart';
// import 'infrastructure/checkout/checkout_repository.dart';
// import 'infrastructure/product/product_repository.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/cart/cart_bloc.dart';
import 'application/category/category_bloc.dart';
import 'application/checkout/checkout_bloc.dart';
import 'application/payment/payment_method_bloc.dart';
import 'application/product/product_bloc.dart';
import 'domain/config/app_router.dart';
import 'infrastructure/category/category_repository.dart';
import 'infrastructure/checkout/checkout_repository.dart';
import 'infrastructure/product/product_repository.dart';

bool shouldUseFirestoreEmulator = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (shouldUseFirestoreEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator(
      'localhost',
      8080,
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => CheckoutBloc(
        //     cartBloc: context.read<CartBloc>(),
        //     // paymentBloc: context.read<PaymentMethodBloc>(),
        //     checkoutRepository: CheckoutRepository(),
        //   ),
        // ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc()
            ..add(
              LoadCart(),
            ),
        ),
        BlocProvider<CategoryBloc>(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(
              LoadCategories(),
            ),
        ),
        BlocProvider<ProductBloc>(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(
              LoadProduct(),
            ),
        ),
        BlocProvider<CheckoutBloc>(
          create: (BuildContext context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            // paymentBloc: context.read<PaymentMethodBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
        BlocProvider<PaymentMethodBloc>(
          create: (_) => PaymentMethodBloc()..add(LoadPayment()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery',
        theme: ThemeData(primarySwatch: Colors.cyan),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: '/',
        // home: const SplashScreen(),
        // initialRoute: '/confirm',
      ),
    );
  }
}
