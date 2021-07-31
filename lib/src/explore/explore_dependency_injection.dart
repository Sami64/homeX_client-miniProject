import 'package:home_x_client/src/explore/data/database/explore_remote_database.dart';
import 'package:home_x_client/src/explore/data/repositories/explore_repository_impl.dart';
import 'package:home_x_client/src/explore/domain/repositories/explore_repository.dart';
import 'package:home_x_client/src/explore/domain/usecases/nearby_services.dart';
import 'package:home_x_client/src/explore/presentation/bloc/explore_bloc.dart';

import '../../injection_container.dart';

void initExplore() {
  // Bloc
  sl.registerFactory(() => ExploreBloc(nearbyServices: sl()));

  // Usecases
  sl.registerLazySingleton(() => NearbyServices(sl()));

  // Repository
  sl.registerLazySingleton<ExploreRepository>(
      () => ExploreRepositoryImpl(networkInfo: sl(), remoteDatabase: sl()));

  // Database
  sl.registerLazySingleton<ExploreRemoteDatabase>(
      () => ExploreRemoteDatabaseImpl(sl()));
}
