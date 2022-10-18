import 'package:flutter/material.dart';

import '../widget/custom_app_bar.dart';

class ProductInformation extends StatelessWidget {
  const ProductInformation({super.key});

  static const String routeName = '/pinfo';
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProductInformation(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(appBarTitle: 'data', appBarIcon: Icons.favorite),
      ),
    );
  }
}
