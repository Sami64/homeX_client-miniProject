import 'package:flutter/foundation.dart';

class RemoteApi {
  static const endpoint = kReleaseMode ? '' : 'http://192.168.8.131:8000/api';
}
