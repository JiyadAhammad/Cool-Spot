import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_bootom_bar_widget.dart';
import '../widget/price_details_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  static const String routeName = '/checkout';
  static Route<CheckoutScreen> route() {
    return MaterialPageRoute<CheckoutScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CheckoutScreen(),
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
          appBarTitle: 'Checkout',
          appBarIcon: Icons.map,
          onPressed: () {
            Navigator.pushNamed(context, '/map');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFiledWidget(
                  suffixIcon: Icons.my_location,
                  hintText: 'click icon to search Location',
                  onPressed: () {
                    Navigator.pushNamed(context, '/map');
                  }),
              kheight20,
              ContainerWidget(
                date: 'Select Payment Method',
                iconData: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.pushNamed(context, '/payment');
                },
              ),
              kheight20,
              const Text(
                'Order Summary',
                style: TextStyle(fontSize: 24),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: PriceDetailsWidget(),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CutomeBottomBarWidget(
      //   text: 'Order Now',
      //   onPressed: () {},
      // ),
    );
  }
}

class TextFiledWidget extends StatelessWidget {
  const TextFiledWidget({
    super.key,
    required this.suffixIcon,
    required this.onPressed,
    required this.hintText,
  });
  final IconData suffixIcon;
  final Function() onPressed;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kblack,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: GestureDetector(
              onTap: onPressed,
              child: Icon(
                suffixIcon,
                color: kblack,
              ),
            ),
            fillColor: kwhite,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.date,
    required this.iconData,
    required this.onPressed,
  });
  final String date;
  final IconData iconData;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/payment');
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kblack,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  date,
                  style: const TextStyle(
                    color: kwhiteText,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Spacer(),
              IconButton(
                onPressed: onPressed,
                icon: Icon(iconData),
                color: kwhiteIcon,
              )
            ],
          ),
        ),
      ),
    );
  }
}
