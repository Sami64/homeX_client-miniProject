import 'dart:convert';

import 'package:home_x_client/core/data/remote_api.dart';
import 'package:home_x_client/core/errors/exception.dart';
import 'package:home_x_client/core/service/data/models/category_model.dart';
import 'package:home_x_client/core/service/data/models/service_model.dart';
import 'package:home_x_client/core/service/domain/entities/service.dart';
import 'package:http/http.dart' as http;

abstract class ServiceRemoteDatabase {
  Future<List<CategoryModel>> allServicesRequest();

  Future<List<ServiceModel>> categoryServicesRequest({required String pk});

  Future<ServiceModel> serviceDetailRequest({required String pk});
}

class ServiceRemoteDatabaseImpl extends ServiceRemoteDatabase {
  final http.Client client;

  ServiceRemoteDatabaseImpl(this.client);

  @override
  Future<List<CategoryModel>> allServicesRequest() async {
    try {
      final response = await client
          .get(Uri.parse('${RemoteApi.endpoint}/services/categories'));
      //print(response.statusCode);
      if (response.statusCode == 200) {
        final serviceCategories = json.decode(response.body);
        return serviceCategories
            .map<CategoryModel>((service) => CategoryModel.fromJson(service))
            .toList();
      } else
        throw ServerException.fromJson(json.decode(response.body));
    } on http.ClientException {
      throw ServerException("Please Come Back Later");
    }
  }

  @override
  Future<List<ServiceModel>> categoryServicesRequest(
      {required String pk}) async {
    try {
      final response = await client.get(Uri.parse(
          '${RemoteApi.endpoint}/services/categories/${int.parse(pk)}'));
      if (response.statusCode == 200) {
        final categoryServices = json.decode(response.body);
        return categoryServices
            .map<ServiceModel>((service) => ServiceModel.fromJson(service))
            .toList();
      } else
        throw ServerException.fromJson(json.decode(response.body));
    } on http.ClientException {
      throw ServerException("Please Come Back Later");
    }
  }

  @override
  Future<ServiceModel> serviceDetailRequest({required String pk}) async {
    try {
      final response = await client
          .get(Uri.parse('${RemoteApi.endpoint}/services/service/$pk'));
      if (response.statusCode == 200) {
        return ServiceModel.fromJson(json.decode(response.body));
      } else
        throw ServerException.fromJson(json.decode(response.body));
    } on http.ClientException {
      throw ServerException("Please Come Back Later");
    }
  }
}
