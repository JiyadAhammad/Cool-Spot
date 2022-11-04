import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/category/category_bloc.dart';
import '../../application/product/product_bloc.dart';
import '../../domain/category_model/category_model.dart';
import '../../domain/product_model/product_model.dart';
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
      appBar: CustomAppBar(
        leadingOnPressed: () => Navigator.of(context).push(
          MaterialPageRoute<Navdrawer>(
            builder: (_) => const Navdrawer(),
          ),
        ),
        icon: Icons.density_medium,
        appBarTitle: 'Coolspot',
        appBarIcon: Icons.favorite,
        onPressed: () => Navigator.pushNamed(context, '/whish'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (BuildContext context, CategoryState state) {
                if (state is CategoryLoding) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                if (state is CategoryLoded) {
                  log('${state.categories} this categories fetch from firebase');
                  return SizedBox(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 1.5,
                        viewportFraction: 0.90,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 2),
                      ),
                      items: state.categories
                          .map((Category item) => CarouselCard(
                                category: item,
                              ))
                          .toList(),
                      // items: Category.categories
                      //     .map((Category item) => CarouselCard(category: item))
                      //     .toList(),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'Something Went Wrong',
                    ),
                  );
                }
              },
            ),
            kheight,
            const HomeSectionwidget(
              sectionTitle: 'RECOMMENDED',
            ),
            kheight,
            BlocBuilder<ProductBloc, ProductState>(
              builder: (BuildContext context, ProductState state) {
                if (state is ProductLoding) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                if (state is ProductLoded) {
                  log('${state.products} this prodcucts fetch from firebase');
                  return state.products.isEmpty
                      ? const Text('No Item Found')
                      : ProductCarousel(
                          products: state.products
                              .where((Product item) => item.isrecommended)
                              .toList(),
                        );
                } else {
                  return const Text('Something Went Wrong');
                }
              },
            ),
            kheight,
            const HomeSectionwidget(
              sectionTitle: 'MOST POPULAR',
            ),
            kheight,
            BlocBuilder<ProductBloc, ProductState>(
              builder: (BuildContext context, ProductState state) {
                if (state is ProductLoding) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                if (state is ProductLoded) {
                  return state.products.isEmpty
                      ? const Text('No Item Found')
                      : ProductCarousel(
                          products: state.products
                              .where((Product item) => item.ispopular)
                              .toList(),
                        );
                } else {
                  return const Text('Something Went Wrong');
                }
              },
            ),
            kheight20,
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
