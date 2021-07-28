import 'package:home_x_client/src/orders/domain/entities/order.dart';

class OrderModel extends Orders {
  OrderModel(
      {required String serviceID,
      required String clientID,
      required String orderID})
      : super(orderID: orderID, serviceID: serviceID, clientID: clientID);

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        clientID: json.containsKey('clientid') ? json['clientid'] : '',
        orderID: json.containsKey('orderspk') ? json['orderspk'] : '',
        serviceID: json.containsKey('serviceid') ? json['serviceid'] : '');
  }
}
