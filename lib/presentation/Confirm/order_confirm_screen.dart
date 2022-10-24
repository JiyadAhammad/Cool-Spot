import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_bootom_bar_widget.dart';
import '../widget/price_details_widget.dart';

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
      appBar: CustomAppBar(
        appBarTitle: 'OrderConfirm',
        appBarIcon: Icons.check,
        onPressed: () {},
        leadingOnPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
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
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 30,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'order Completed Succesfully',
                    style: TextStyle(
                      color: kblackText,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                kheight50,
                Text(
                  'Hi Jiyad',
                  style: TextStyle(
                    color: kblackText,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kheight,
                Text(
                  'Thank you purchsing on Cool Spot ',
                  style: TextStyle(
                    color: kblackText,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                kheight50,
                PriceDetailsWidget(),
              ],
            ),
          )
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
