import 'package:home_x_client/core/service/data/models/seller_model.dart';
import 'package:home_x_client/core/service/domain/entities/service.dart';

class ServiceModel extends Service {
  ServiceModel(
      {required String key,
      required String name,
      required String category,
      required String description,
      required String image,
      required String features,
      required SellerModel seller})
      : super(
            key: key,
            seller: seller,
            category: category,
            name: name,
            image: image,
            description: description,
            features: features);

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
        key: json['pk'].toString(),
        description: json.containsKey('serviceDescription')
            ? json['serviceDescription']
            : '',
        name: json.containsKey('serviceName') ? json['serviceName'] : '',
        image: json.containsKey('image') ? json['image'] : '',
        category: json.containsKey('category') ? json['category'] : '',
        features: json.containsKey('features') ? json['features'] : '',
        seller: SellerModel.fromJson(json['seller']));
  }

  factory ServiceModel.initial() => ServiceModel(
      key: 'key',
      name: 'name',
      category: 'category',
      description: 'description',
      image: '',
      features: 'features',
      seller: SellerModel.initial());
}
