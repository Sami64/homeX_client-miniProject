import 'dart:io';

import 'package:home_x_client/core/errors/exception.dart';

abstract class NetworkInfo {
  /// Verify internet connection
  Future<void> hasInternet();
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
      throw ServerException(
          'Opps!!.No internet access\nPlease connect to the inernet.');
    } on SocketException catch (_) {
      throw ServerException(
          'Opps!!.No internet access\nPlease connect to the inernet.');
    }
  }
}
