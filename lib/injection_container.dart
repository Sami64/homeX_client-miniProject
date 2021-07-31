import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:home_x_client/core/user/user_dependency_injection.dart';
import 'package:home_x_client/src/explore/explore_dependency_injection.dart';
import 'package:home_x_client/src/home/home_dependency_injection.dart';
import 'package:home_x_client/src/login/login_dependency_injection.dart';
import 'package:home_x_client/src/service_details/service_details_dependency_injection.dart';
import 'package:home_x_client/src/sign_up/sign_up_dependency_injection.dart';
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
  initUser();

  sl.registerLazySingleton<LaunchInfo>(() => LaunchInfoImpl());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}

void initFeatures() {
  initHome();
  initServiceDetails();
  initLogin();
  initSignup();
  initExplore();
}

void initExternal() {
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<HiveInterface>(() => Hive);
}
