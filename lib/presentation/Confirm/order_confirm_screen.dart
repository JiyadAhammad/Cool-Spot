import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_bootom_bar_widget.dart';
import '../widget/price_details_widget.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  static const String routeName = '/confirm';
  static Route<OrderConfirmationScreen> route() {
    return MaterialPageRoute<OrderConfirmationScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OrderConfirmationScreen(),
    );
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
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        // controller: controller,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget> [
                Container(
                  color: kblack,
                  width: double.infinity,
                  height: 300,
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  top: 125,
                  child: SvgPicture.asset(
                    'assets/images/garlands.svg',
                  ),
                ),
                Positioned(
                  top: 230,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'order Completed Succesfully',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kwhiteText,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>  [
                  const Text(
                    'Hi Jiyad',
                    style: TextStyle(
                      color: kblackText,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kheight,
                  const Text(
                    'Thank you purchsing on Cool Spot ',
                    style: TextStyle(
                      color: kblackText,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  kheight20,
                  const Text(
                    'ORDER CODE : 123456',
                    style: TextStyle(
                      color: kblackText,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  kheight50,
                  const PriceDetailsWidget(),
                  kheight,
                  const Divider(
                    thickness: 2,
                    color: kblack,
                  ),
                  kheight,
                  const Text(
                    'ORDER DETAILS',
                    style: TextStyle(
                      color: kblackText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    // children: const <Widget> [],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      // body: Stack(
      //   children: <Widget>[
      //     SizedBox(
      //       height: MediaQuery.of(context).size.width / 2,
      //       child: Align(
      //         child: ConfettiWidget(
      //           confettiController: _controllerCenter,
      //           blastDirection: pi / 2,
      //           maxBlastForce: 5,
      //           minBlastForce: 1,
      //           emissionFrequency: 0.03,
      //           gravity: 0,
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(
      //         vertical: 30,
      //         horizontal: 30,
      //       ),
      //       child: Column(
      //         // mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: const <Widget>[
      //           Align(
      //             alignment: Alignment.topCenter,
      //             child: Text(
      //               'order Completed Succesfully',
      //               style: TextStyle(
      //                 color: kblackText,
      //                 fontSize: 25,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ),
      //           kheight50,
      //           Text(
      //             'Hi Jiyad',
      //             style: TextStyle(
      //               color: kblackText,
      //               fontSize: 25,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           kheight,
      //           Text(
      //             'Thank you purchsing on Cool Spot ',
      //             style: TextStyle(
      //               color: kblackText,
      //               fontSize: 25,
      //               fontWeight: FontWeight.w400,
      //             ),
      //           ),
      //           kheight50,
      //           PriceDetailsWidget(),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
      bottomNavigationBar: CutomeBottomBarWidget(
        text: 'Back to Home',
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
    );
  }
}
