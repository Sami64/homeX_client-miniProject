import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:home_x_client/core/data/remote_api.dart';
import 'package:home_x_client/core/errors/exception.dart';
import 'package:home_x_client/src/explore/data/models/explore_model.dart';
import 'package:http/http.dart' as http;

abstract class ExploreRemoteDatabase {
  Future<List<ExploreModel>> nearbyServicesRequest();
}

class ExploreRemoteDatabaseImpl implements ExploreRemoteDatabase {
  final http.Client client;

  ExploreRemoteDatabaseImpl(this.client);

  @override
  Future<List<ExploreModel>> nearbyServicesRequest() async {
    try {
      Position userPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      final response = await client
          .post(Uri.parse('${RemoteApi.endpoint}/services/nearby'), body: {
        "latitude": userPosition.latitude.toString(),
        "longitude": userPosition.longitude.toString()
      });
      if (response.statusCode == 200) {
        final nearbyServices = json.decode(response.body);
        return nearbyServices
            .map<ExploreModel>(
                (nearbyService) => ExploreModel.fromJson(nearbyService))
            .toList();
      } else {
        throw ServerException.fromJson(json.decode(response.body));
      }
    } on http.ClientException {
      throw ServerException("Please Come Back Later");
    }
  }
}
