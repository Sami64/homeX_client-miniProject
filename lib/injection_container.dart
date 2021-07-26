import 'package:get_it/get_it.dart';
import 'package:home_x_client/src/home/home_dependency_injection.dart';
import 'package:http/http.dart' as http;
import 'package:home_x_client/core/platform/launch_info.dart';
import 'package:home_x_client/core/platform/network_info.dart';
import 'package:home_x_client/core/service/service_dependency_injection.dart';

final sl = GetIt.instance;

void init() {
  initCore();
  initFeatures();
  initExternal();
}

void initCore() {
  initService();

  sl.registerLazySingleton<LaunchInfo>(() => LaunchInfoImpl());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}

void initFeatures() {
  initHome();
}

void initExternal() {
  sl.registerLazySingleton(() => http.Client());
}
