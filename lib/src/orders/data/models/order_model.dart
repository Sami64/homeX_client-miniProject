import 'package:home_x_client/src/orders/domain/entities/order.dart';

class OrderModel extends Orders {
  OrderModel({required String key, required String orderID})
      : super(orderID: orderID, pk: key);

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(key: json['pk'], orderID: json['orderno']);
  }
}
