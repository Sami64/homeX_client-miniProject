import 'package:home_x_client/core/service/domain/entities/seller.dart';
import 'package:home_x_client/src/explore/domain/entities/nearby_service.dart';

class ExploreModel extends NearbyService {
  ExploreModel(
      {required String key,
      required double latitude,
      required double longitude,
      required String name,
      required Seller seller})
      : super(
            key: key,
            latitude: latitude,
            longitude: longitude,
            seller: seller,
            serviceName: name);

  factory ExploreModel.fromJson(Map<String, dynamic> json) {
    return ExploreModel(
        key: json['pk'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        name: json['servicename'],
        seller: json['seller']);
  }
}
