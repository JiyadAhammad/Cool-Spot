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
          appBarTitle: 'Checkout',
          appBarIcon: Icons.map,
          onPressed: () {},
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
              TextFormField(
                style: const TextStyle(
                  fontSize: 24,
                  color: kblackText,
                  fontWeight: FontWeight.w600,
                ),
                // onChanged: (String value) {
                //   // setState(() {
                //   //   userInput.text = value.toString();
                //   // });
                // },
                decoration: InputDecoration(
                  focusColor: Colors.white,

                  //add suffix icon
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.my_location_outlined,
                      color: Colors.grey,
                    ),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  fillColor: Colors.grey,

                  hintText: 'Select Delivery Location',

                  //make hint text
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: 'verdana_regular',
                    fontWeight: FontWeight.w400,
                  ),

                  //create lable
                  labelText: 'Select Delivery Location',
                  //lable style
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: 'verdana_regular',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              kheight20,
              GestureDetector(
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
                        const Expanded(
                          child: Text(
                            'Select Payment Method',
                            style: TextStyle(
                              color: kwhiteText,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                          color: kwhiteIcon,
                        )
                      ],
                    ),
                  ),
                ),
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
      bottomNavigationBar: const CutomeBottomBarWidget(text: 'Order Now'),
    );
  }
}
