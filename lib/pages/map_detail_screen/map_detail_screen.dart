import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/pages/map_detail_screen/widgets/map_details_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapDetailScreen extends StatelessWidget {
  const MapDetailScreen({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    const LatLng _kGooglePlex = LatLng(31.092724, 72.656518);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Map"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          const GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
              target: _kGooglePlex,
              zoom: 14,
            ),
          ),
          Positioned(right: 0, left: 0, bottom: 0, child: carDetails(car: car)),
        ],
      ),
    );
  }
}
