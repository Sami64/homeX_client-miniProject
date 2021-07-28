import 'package:equatable/equatable.dart';

class Orders extends Equatable {
  final String orderID;
  final String clientID;
  final String serviceID;

  Orders(
      {required this.clientID, required this.serviceID, required this.orderID});

  @override
  List<Object> get props => [clientID, serviceID, orderID];
}
