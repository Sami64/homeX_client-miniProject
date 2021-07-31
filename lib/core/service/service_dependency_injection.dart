import 'package:get_it/get_it.dart';
import 'package:home_x_client/core/service/domain/usecases/category_services.dart';
import 'package:home_x_client/core/service/domain/usecases/complete_service.dart';

import 'data/database/service_remote_database.dart';
import 'data/repositories/service_repository.dart';
import 'domain/repositories/service_repository.dart';
import 'domain/usecases/all_services.dart';
import 'domain/usecases/service_details.dart';

void initService() {
  final sl = GetIt.instance;

  /// Bloc
  ///
  ///
  ///
  /// Usecases
  sl.registerLazySingleton(() => AllServices(sl()));
  sl.registerLazySingleton(() => ServiceDetails(sl()));
  sl.registerLazySingleton(() => CategoryServices(sl()));
  sl.registerLazySingleton(() => CompleteService(sl()));

  /// Repositories
  sl.registerLazySingleton<ServiceRepository>(
      () => ServiceRepositoryImpl(networkInfo: sl(), remoteDatabase: sl()));

  /// Database
  sl.registerLazySingleton<ServiceRemoteDatabase>(
      () => ServiceRemoteDatabaseImpl(sl()));
}
