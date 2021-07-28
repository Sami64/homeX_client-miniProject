import 'package:flutter/foundation.dart';

class RemoteApi {
  static const endpoint = kReleaseMode ? '' : 'http://100.114.2.76:8000/api';
}
