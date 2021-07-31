import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_x_client/src/explore/domain/entities/nearby_service.dart';
import 'package:home_x_client/src/explore/presentation/bloc/explore_bloc.dart';

import '../../../../injection_container.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late GoogleMapController _controller;
  final _bloc = sl<ExploreBloc>();

  final LatLng _center = const LatLng(28.535517, 77.391029);
  final Map<String, Marker> _markers = {};

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    List<NearbyService> nearbyServices = await _bloc.getNearbyServices();

    setState(() {
      _markers.clear();
      for (final nearbyService in nearbyServices) {
        final marker = Marker(
            markerId: MarkerId(nearbyService.key),
            position: LatLng(nearbyService.latitude, nearbyService.longitude),
            onTap: () => Navigator.of(context).pushNamed('/serviceDetails'),
            infoWindow: InfoWindow(title: nearbyService.serviceName));
        _markers[nearbyService.key] = marker;
      }
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
