import 'package:home_x_client/core/user/data/database/user_local_database.dart';
import 'package:home_x_client/core/user/data/database/user_remote_database.dart';
import 'package:home_x_client/core/user/data/repositories/user_repository_impl.dart';
import 'package:home_x_client/core/user/domain/repositories/user_repository.dart';
import 'package:home_x_client/core/user/domain/usecases/login.dart';
import 'package:home_x_client/core/user/domain/usecases/sign_up.dart';

import '../../injection_container.dart';

void initUser() {
  /// Bloc

  /// Usecase
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => SignUp(sl()));

  /// Repository
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
      networkInfo: sl(), remoteDatabase: sl(), localDatabase: sl()));

  /// Database
  sl.registerLazySingleton<UserLocalDatabase>(
      () => UserLocalDatabaseImpl(sl()));

  sl.registerLazySingleton<UserRemoteDatabase>(() => UserRemoteDatabaseImpl(sl()));
}
