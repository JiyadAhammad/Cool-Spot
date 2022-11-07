import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/checkout/checkout_bloc.dart';
import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/custom_app_bar.dart';
import '../widget/price_details_widget.dart';
import 'widget/container_widget.dart';
import 'widget/customer_detail_widget.dart';
import 'widget/text_field_widget.dart';

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
      appBar: CustomAppBar(
        leadingOnPressed: () => Navigator.pop(context),
        appBarTitle: 'Checkout',
        appBarIcon: Icons.map,
        onPressed: () {
          Navigator.pushNamed(context, '/map');
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (BuildContext context, CheckoutState state) {
              if (state is CheckoutLoding) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              if (state is CheckoutLoded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFiledWidget(
                        suffixIcon: Icons.my_location,
                        hintText: 'click icon to search Location',
                        onPressed: () {
                          Navigator.pushNamed(context, '/map');
                        }),
                    kheight20,
                    const Text(
                      'DELIVERY INFORMATION',
                      style: TextStyle(
                        color: kblackText,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    kheight,
                    CustomTextFormField(
                      title: 'Location',
                      onChanged: (String value) {
                        context.read<CheckoutBloc>().add(
                              UpdateChekout(location: value),
                            );
                      },
                    ),
                    kheight,
                    CustomTextFormField(
                      title: 'Address',
                      onChanged: (String value) {
                        context.read<CheckoutBloc>().add(
                              UpdateChekout(address: value),
                            );
                      },
                    ),
                    kheight,
                    CustomTextFormField(
                      title: 'City',
                      onChanged: (String value) {
                        context.read<CheckoutBloc>().add(
                              UpdateChekout(city: value),
                            );
                      },
                    ),
                    kheight,
                    CustomTextFormField(
                      title: 'LandMark',
                      onChanged: (String value) {
                        context.read<CheckoutBloc>().add(
                              UpdateChekout(landMark: value),
                            );
                      },
                    ),
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
                      style: TextStyle(
                        color: kblackText,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: PriceDetailsWidget(),
                    )
                  ],
                );
              } else {
                return const Text(
                  'Some Went Wrong',
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
