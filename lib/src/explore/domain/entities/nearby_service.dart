import 'package:equatable/equatable.dart';
import 'package:home_x_client/core/service/domain/entities/seller.dart';

class NearbyService extends Equatable {
  final String key;
  final double latitude;
  final double longitude;
  final String serviceName;
  final String serviceKey;
  final Seller seller;

  NearbyService(
      {required this.key,
      required this.latitude,
      required this.longitude,
      required this.seller,
      required this.serviceKey,
      required this.serviceName});

  @override
  List<Object> get props => [key, latitude, longitude, seller, serviceName, serviceKey];
}
