import 'package:flutter/foundation.dart';

class RemoteApi {
  static const endpoint = kReleaseMode ? '' : 'http://100.114.0.189:8000/api';
}
