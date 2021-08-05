import 'package:home_x_client/core/service/data/models/seller_model.dart';
import 'package:home_x_client/core/service/domain/entities/seller.dart';
import 'package:home_x_client/src/explore/domain/entities/nearby_service.dart';

class ExploreModel extends NearbyService {
  ExploreModel(
      {required String key,
      required double latitude,
      required double longitude,
      required String name,
      required String serviceKey,
      required Seller seller})
      : super(
            key: key,
            latitude: latitude,
            longitude: longitude,
            seller: seller,
            serviceKey: serviceKey,
            serviceName: name);

  factory ExploreModel.fromJson(Map<String, dynamic> json) {
    return ExploreModel(
        key: json['nearbypk'].toString(),
        latitude: double.parse(json['latitude']),
        longitude: double.parse(json['longitude']),
        name: json.containsKey('servicename') ? json['servicename'] : '',
        serviceKey:
            json.containsKey('servicespk') ? json['servicespk'].toString() : '',
        seller: json.containsKey('sellername')
            ? SellerModel.fromJson({
                'sellerName': json['sellername'],
                'email': json['email']
              })
            : SellerModel.initial());
  }
}
