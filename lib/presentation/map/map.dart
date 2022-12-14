import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/checkout/checkout_model.dart';
import '../checkout/checkout_screen.dart';
import '../checkout/widget/text_field_widget.dart';

// class LocationScreen extends StatelessWidget {
//   const LocationScreen({super.key});

//   static const String routeName = '/map';
//   static Route<LocationScreen> route() {
//     return MaterialPageRoute<LocationScreen>(
//       settings: const RouteSettings(name: routeName),
//       builder: (_) => const LocationScreen(),
//     );
//   }

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(
//       11.683948,
//       76.286619,
//     ),
//     zoom: 14.4746,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: <Widget>[
//             // Text('dsfghj'),
//             SizedBox(
//               height: MediaQuery.of(context).size.height,
//               width: double.infinity,
//               child: const GoogleMap(
//                 myLocationEnabled: true,
//                 mapType: MapType.hybrid,
//                 initialCameraPosition: _kGooglePlex,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFiledWidget(
//                 suffixIcon: Icons.search,
//                 hintText: 'Search Location',
//                 onPressed: () {},
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

List<Placemark> placeMark = <Placemark>[];

class MapLocationScreen extends StatefulWidget {
  const MapLocationScreen({super.key});
  static const CameraPosition camera = CameraPosition(
    target: LatLng(10.5483666, 76.2301987),
    zoom: 10,
  );

  @override
  State<MapLocationScreen> createState() => _MapLocationScreenState();
}

class _MapLocationScreenState extends State<MapLocationScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  List<Marker> locationMarker = <Marker>[
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(10.5483666, 76.2301987),
      infoWindow: InfoWindow(title: 'location'),
    ),
  ];

  Future<Position> getCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((LocationPermission value) {})
        .onError((Object? error, StackTrace stackTrace) {
      print('error $error');
    });
    return Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    getMyLocation();
    // log(locationMarker.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: MapLocationScreen.camera,
        markers: Set<Marker>.of(locationMarker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  void getMyLocation() {
    getCurrentLocation().then((Position value) async {
      locationMarker.add(
        Marker(
            markerId: const MarkerId('2'),
            position: LatLng(value.latitude, value.longitude),
            infoWindow: const InfoWindow(title: 'My current Location')),
      );
      final CameraPosition camPosition = CameraPosition(
        zoom: 50,
        target: LatLng(value.latitude, value.longitude),
      );
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(camPosition),
      );

      placeMark = await GeocodingPlatform.instance
          .placemarkFromCoordinates(value.latitude, value.longitude);

      // await placemarkFromCoordinates(value.latitude, value.longitude,
      //     localeIdentifier: 'en');
      // Get.off(() => const CheckoutScreen());
      // log('${placeMark[0].locality} location');
      Timer(
        Duration(seconds: 5),
        () {
          Get.off(() => const CheckoutScreen());
        },
      );
      setState(() {});
    });
  }
}
