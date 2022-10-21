import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../checkout/checkout_screen.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  static const String routeName = '/map';
  static Route<LocationScreen> route() {
    return MaterialPageRoute<LocationScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LocationScreen(),
    );
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(
      11.683948,
      76.286619,
    ),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // Text('dsfghj'),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: const GoogleMap(
                myLocationEnabled: true,
                mapType: MapType.hybrid,
                initialCameraPosition: _kGooglePlex,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFiledWidget(
                suffixIcon: Icons.search,
                hintText: 'Search Location',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
