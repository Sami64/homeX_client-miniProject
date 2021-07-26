import 'package:get_it/get_it.dart';

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

  /// Repositories
  sl.registerLazySingleton<ServiceRepository>(
      () => ServiceRepositoryImpl(networkInfo: sl(), remoteDatabase: sl()));

  /// Database
  sl.registerLazySingleton<ServiceRemoteDatabase>(
      () => ServiceRemoteDatabaseImpl(sl()));
}
