import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_bootom_bar_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  static const String routeName = '/payment';
  static Route<PaymentScreen> route() {
    return MaterialPageRoute<PaymentScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const PaymentScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          leadingOnPressed: () => Navigator.pop(context),
          appBarTitle: 'Payment',
          appBarIcon: Icons.money,
          onPressed: () {},
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: CashOnDeliveryContainer(),
      ),
      bottomNavigationBar: CutomeBottomBarWidget(
        text: 'Pay',
        onPressed: () {
          Navigator.pushNamed(context, '/confirm');
        },
      ),
    );
  }
}

class CashOnDeliveryContainer extends StatelessWidget {
  const CashOnDeliveryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kwhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          children: const <Widget>[
            SizedBox(
              width: 30,
              child: Image(
                image: AssetImage('assets/images/money.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
            kwidth,
            Expanded(
              child: Text(
                'Cash on Delivery',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}
