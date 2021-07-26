import 'package:flutter/foundation.dart';

class RemoteApi {
  static const endpoint = kReleaseMode ? '' : 'http://192.168.99.222:8000/api';
}
