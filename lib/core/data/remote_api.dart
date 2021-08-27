import 'package:flutter/foundation.dart';

class RemoteApi {
  static const endpoint = kReleaseMode
      ? 'https://shrouded-tundra-60754.herokuapp.com/api'
      : 'http://100.114.1.50:8000/api';
}
