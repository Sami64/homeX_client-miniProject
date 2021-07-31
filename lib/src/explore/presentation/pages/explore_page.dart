import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late GoogleMapController _controller;

  final LatLng _center = const LatLng(28.535517, 77.391029);
  final Map<String, Marker> _markers = {};

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;

    setState(() {
      _markers.clear();
      final marker = Marker(
          markerId: MarkerId(''),
          position: LatLng(1.256, 354.56),
          onTap: () => Navigator.of(context).pushNamed('/serviceDetails'),
          infoWindow: InfoWindow());
      _markers[''] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: GoogleMap(
        onMapCreated: onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 10),
      )),
    );
  }
}
