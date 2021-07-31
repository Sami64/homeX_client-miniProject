import 'dart:convert';

import 'package:home_x_client/core/data/remote_api.dart';
import 'package:home_x_client/core/errors/exception.dart';
import 'package:home_x_client/src/orders/data/models/order_model.dart';
import 'package:http/http.dart' as http;

abstract class OrdersRemoteDatabase {
  Future<List<OrderModel>> allOrdersRequest({required String clientID});

  Future<List<OrderModel>> completedOrdersRequest({required String clientID});

  Future<OrderModel> orderServiceRequest(
      {required String clientID, required String serviceID});
}

class OrdersRemoteDatabaseImpl extends OrdersRemoteDatabase {
  final http.Client client;

  OrdersRemoteDatabaseImpl(this.client);

  @override
  Future<List<OrderModel>> allOrdersRequest({required String clientID}) async {
    try {
      final response = await client.get(Uri.parse(
          '${RemoteApi.endpoint}/services/orders/${int.parse(clientID)}'));
      if (response.statusCode == 200) {
        final orders = json.decode(response.body);
        return orders
            .map<OrderModel>((order) => OrderModel.fromJson(order))
            .toList();
      } else {
        throw ServerException.fromJson(json.decode(response.body));
      }
    } on http.ClientException {
      throw ServerException("Please Come Back Later");
    }
  }

  @override
  Future<List<OrderModel>> completedOrdersRequest({required String clientID}) async {
    try {
      final response = await client.get(Uri.parse(
          '${RemoteApi.endpoint}/services/orders-completed/${int.parse(clientID)}'));
      if (response.statusCode == 200) {
        final orders = json.decode(response.body);
        return orders
            .map<OrderModel>((order) => OrderModel.fromJson(order))
            .toList();
      } else {
        throw ServerException.fromJson(json.decode(response.body));
      }
    } on http.ClientException {
      throw ServerException("Please Come Back Later");
    }
  }

  @override
  Future<OrderModel> orderServiceRequest(
      {required String clientID, required String serviceID}) async {
    try {
      final response = await client.post(
          Uri.parse("${RemoteApi.endpoint}/services/order"),
          body: {"clientID": clientID, "serviceID": serviceID});
      if (response.statusCode == 200) {
        return OrderModel.fromJson(json.decode(response.body));
      } else
        throw ServerException.fromJson(json.decode(response.body));
    } on http.ClientException {
      throw ServerException("Please Come Back Later");
    }
  }
}
