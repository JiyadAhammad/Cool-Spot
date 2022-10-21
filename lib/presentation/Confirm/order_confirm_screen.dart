import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_bootom_bar_widget.dart';

class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({super.key});

  static const String routeName = '/confirm';
  static Route<OrderConfirmationScreen> route() {
    return MaterialPageRoute<OrderConfirmationScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OrderConfirmationScreen(),
    );
  }

  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  late ConfettiController _controllerCenter;
  @override
  void initState() {
    super.initState();
    _controllerCenter = ConfettiController(
      duration: const Duration(minutes: 1),
    );
    _controllerCenter.play();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          appBarTitle: 'OrderConfirm',
          appBarIcon: Icons.widgets_sharp,
          onPressed: () {},
          leadingOnPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.width / 2,
            child: Align(
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirection: pi / 2,
                maxBlastForce: 5,
                minBlastForce: 1,
                emissionFrequency: 0.03,
                gravity: 0,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CutomeBottomBarWidget(
        text: 'Back to Home',
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
    );
  }
}
