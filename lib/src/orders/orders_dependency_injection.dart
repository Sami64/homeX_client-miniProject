import 'package:home_x_client/src/orders/data/database/orders_remote_database.dart';
import 'package:home_x_client/src/orders/data/repositories/orders_repository_impl.dart';
import 'package:home_x_client/src/orders/domain/repositories/orders_repository.dart';
import 'package:home_x_client/src/orders/domain/usecases/all_orders.dart';
import 'package:home_x_client/src/orders/domain/usecases/order_service.dart';
import 'package:home_x_client/src/orders/presentation/bloc/orders_bloc.dart';

import '../../injection_container.dart';

void initOrders() {
  // Bloc
  sl.registerFactory(
      () => OrdersBloc(allOrders: sl(), userData: sl(), completedOrders: sl()));

  // Usecase
  sl.registerLazySingleton(() => AllOrders(sl()));
  sl.registerLazySingleton(() => OrderService(sl()));

  // Repository
  sl.registerLazySingleton<OrdersRepository>(
      () => OrdersRepositoryImpl(networkInfo: sl(), remoteDatabase: sl()));

  // Database
  sl.registerLazySingleton<OrdersRemoteDatabase>(
      () => OrdersRemoteDatabaseImpl(sl()));
}
