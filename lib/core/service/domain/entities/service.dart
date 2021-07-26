import 'package:equatable/equatable.dart';
import 'package:home_x_client/core/service/domain/entities/seller.dart';

class Service extends Equatable {
  final String key;
  final String name;
  final String category;
  final String features;
  final Seller seller;

  Service(
      {required this.key,
      required this.name,
      required this.category,
      required this.features,
      required this.seller});

  @override
  List<Object> get props => [key, name, category, features, seller];
}
