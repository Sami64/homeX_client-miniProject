import 'dart:convert';

import 'package:home_x_client/core/data/remote_api.dart';
import 'package:home_x_client/core/errors/exception.dart';
import 'package:home_x_client/core/user/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDatabase {
  /// Call [RemoteApi.endpoint]/client/sign-up/ endpoint
  Future<UserModel> signUpRequest(
      {required String name,
      required String email,
      required String password,
      required String phoneNumber,
      required String residentialAddress});

  /// Call [RemoteApi.endpoint]/client/login/ endpoint
  Future<UserModel> loginRequest(
      {required String name, required String password});

  /// Call [RemoteApi.endpoint]/otp
  //Future<OtpModel> otpRequest({required String number, required String name, required String token});

  /// Call [RemoteApi.endpoint]/client/profile/$id/
  Future<UserModel> userDataRequest({required String token});
}

class UserRemoteDatabaseImpl implements UserRemoteDatabase {
  final http.Client client;

  UserRemoteDatabaseImpl(this.client);

  Future<UserModel> _request(Function request) async {
    try {
      final response = await request();
      print('RESPONSEE ${response.body}');
      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        print('EXCEPTION OCCUR');
        //throw ServerException("Server Error");
        throw ServerException.fromJson(jsonDecode(response.body),
            code: response.statusCode);
      }
    } on http.ClientException {
      throw ServerException("Server Error! Try again.");
    }
  }

  @override
  Future<UserModel> signUpRequest(
          {required String name,
          required String email,
          required String phoneNumber,
          required String password,
          required String residentialAddress}) =>
      _request(() =>
          client.post(Uri.parse('${RemoteApi.endpoint}/client/sign-up'), body: {
            "name": name,
            "email": email,
            "password": password,
            "address": residentialAddress,
            "phoneNumber": phoneNumber
          }));

  @override
  Future<UserModel> loginRequest(
          {required String name, required String password}) =>
      _request(() => client.post(
          Uri.parse('${RemoteApi.endpoint}/client/login'),
          body: {'email': name, 'password': password}));

  @override
  Future<UserModel> userDataRequest({required String token}) => _request(() =>
      client.get(Uri.parse('${RemoteApi.endpoint}/client/profile/'),
          headers: {"Authorization": "Bearer $token"}));
}
