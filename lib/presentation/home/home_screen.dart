import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../domain/home/category_model/category_model.dart';
import '../../domain/home/product_model/product_model.dart';
import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../widget/custom_app_bar.dart';
import 'navigation_drawer/drawer.dart';
import 'widget/caurosel_card.dart';
import 'widget/custom_nav_bar.dart';
import 'widget/home_section_widget.dart';
import 'widget/product_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';
  static Route<HomeScreen> route() {
    return MaterialPageRoute<HomeScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navdrawer(),
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          leadingOnPressed: () => const Navdrawer(),
          icon: Icons.density_medium,
          appBarTitle: 'Coolspot',
          appBarIcon: Icons.favorite,
          onPressed: () => Navigator.pushNamed(context, '/whish'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.90,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                ),
                items: Category.categories
                    .map((Category item) => CarouselCard(category: item))
                    .toList(),
              ),
            ),
            const HomeSectionwidget(
              sectionTitle: 'RECOMMENDED',
            ),
            kheight,
            ProductCarousel(
              products: Product.products
                  .where((Product item) => item.isrecommended)
                  .toList(),
            ),
            kheight,
            const HomeSectionwidget(
              sectionTitle: 'MOST POPULAR',
            ),
            kheight,
            ProductCarousel(
              products: Product.products
                  .where((Product item) => item.ispopular)
                  .toList(),
            ),
            kheight20,
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
