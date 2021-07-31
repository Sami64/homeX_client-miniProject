import 'package:equatable/equatable.dart';
import 'package:home_x_client/core/service/domain/entities/seller.dart';

class Orders extends Equatable {
  final String orderID;
  final String clientID;
  final String serviceID;
  final Seller seller;
  final String orderNo;
  final String serviceName;
  final String datePlaced;

  Orders(
      {required this.clientID,
      required this.serviceName,
      required this.serviceID,
      required this.datePlaced,
      required this.orderNo,
      required this.orderID,
      required this.seller});

  @override
  List<Object> get props =>
      [clientID, serviceID, orderID, seller, orderNo, datePlaced, serviceName];
}
