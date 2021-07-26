import 'package:home_x_client/core/service/data/models/seller_model.dart';
import 'package:home_x_client/core/service/domain/entities/service.dart';

class ServiceModel extends Service {
  ServiceModel(
      {required String key,
      required String name,
      required String category,
      required String features,
      required SellerModel seller})
      : super(
            key: key,
            seller: seller,
            category: category,
            name: name,
            features: features);

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
        key: json['pk'],
        name: json['servicename'],
        category: json['category'],
        features: json['features'],
        seller: SellerModel.fromJson(json['seller']));
  }
}
