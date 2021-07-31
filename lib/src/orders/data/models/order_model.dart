import 'package:home_x_client/core/service/domain/entities/seller.dart';
import 'package:home_x_client/src/orders/domain/entities/order.dart';

class OrderModel extends Orders {
  OrderModel(
      {required String serviceID,
      required String clientID,
      required String orderNo,
      required String datePlaced,
      required String serviceName,
      required Seller seller,
      required String orderID})
      : super(
            orderID: orderID,
            serviceID: serviceID,
            clientID: clientID,
            serviceName: serviceName,
            orderNo: orderNo,
            datePlaced: datePlaced,
            seller: seller);

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        clientID: json.containsKey('clientid') ? json['clientid'] : '',
        orderID: json.containsKey('orderspk') ? json['orderspk'] : '',
        seller: json.containsKey('seller') ? json['seller'] : '',
        serviceName: json.containsKey('servicename') ? json['servicename'] : '',
        orderNo: json.containsKey('orderno') ? json['orderno'] : '',
        datePlaced: json.containsKey('dateplaced') ? json['dateplaced'] : '',
        serviceID: json.containsKey('serviceid') ? json['serviceid'] : '');
  }
}
