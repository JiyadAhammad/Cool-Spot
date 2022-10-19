import 'package:flutter/material.dart';

import '../../domain/home/product_model/product_model.dart';
import '../constant/color/colors.dart';
import '../home/widget/custom_nav_bar.dart';
import '../widget/custom_app_bar.dart';

class ProductInformation extends StatelessWidget {
  const ProductInformation({
    super.key,
    required this.product,
  });

  static const String routeName = '/pinfo';
  static Route<dynamic> route({required Product product}) {
    return MaterialPageRoute<dynamic>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductInformation(
        product: product,
      ),
    );
  }

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          appBarTitle: product.productName,
          appBarIcon: Icons.favorite,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: <Widget>[
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.width / 1.5,
                width: MediaQuery.of(context).size.width / 1.1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 6,
                    // color: kwhite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kwhite,
                    ),
                    alignment: Alignment.topCenter,
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width - 10,
                    height: MediaQuery.of(context).size.width / 6 - 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kblack,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            product.productName,
                            style: const TextStyle(color: kwhiteText),
                          ),
                          Text(
                            '₹ ${product.productPrice}',
                            style: const TextStyle(color: kwhiteText),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const ExpandedTileWidget(
              title: 'PRODUCT INFORMATION',
              subTitle:
                  '''when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}

class ExpandedTileWidget extends StatelessWidget {
  const ExpandedTileWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: SingleChildScrollView(child: Text(subTitle)),
          )
        ],
      ),
    );
  }
}
