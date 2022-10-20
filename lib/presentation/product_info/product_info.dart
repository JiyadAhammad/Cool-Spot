import 'package:flutter/material.dart';

import '../../domain/home/product_model/product_model.dart';
import '../constant/color/colors.dart';
import '../widget/custom_app_bar.dart';
import '../widget/elevated_button_widget.dart';
import '../widget/stack_contaien.dart';
import 'widget/expanded_tile_widget.dart';

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
          onPressed: () => Navigator.pushNamed(context, '/whish'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              StackContainerWidget(product: product),
              const ExpandedTileWidget(
                title: 'PRODUCT INFORMATION',
                subTitle:
                    '''when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages''',
              ),
              const ExpandedTileWidget(
                initiallyExpanded: false,
                title: 'DELIVERY INFORMATION',
                subTitle:
                    '''when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages''',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: MediaQuery.of(context).size.width / 6,
          width: MediaQuery.of(context).size.width,
          color: kblack,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: kwhiteIcon,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: kwhiteIcon,
                  size: 30,
                ),
              ),
              const ElevatedButtonWidget(content: 'Add to Cart'),
            ],
          ),
        ),
      ),
    );
  }
}
