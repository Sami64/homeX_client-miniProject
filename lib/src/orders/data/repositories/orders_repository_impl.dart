import 'package:dartz/dartz.dart';
import 'package:home_x_client/core/errors/exception.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/core/platform/network_info.dart';
import 'package:home_x_client/src/orders/data/database/orders_remote_database.dart';
import 'package:home_x_client/src/orders/domain/entities/order.dart';
import 'package:home_x_client/src/orders/domain/repositories/orders_repository.dart';

class OrdersRepositoryImpl extends OrdersRepository {
  final NetworkInfo networkInfo;
  final OrdersRemoteDatabase remoteDatabase;

  OrdersRepositoryImpl(
      {required this.networkInfo, required this.remoteDatabase});

  @override
  Future<Either<Failure, List<Orders>>> getOrders(
      {required String clientID}) async {
    try {
      await networkInfo.hasInternet();
      final remoteOrders =
          await remoteDatabase.allOrdersRequest(clientID: clientID);
      return Right(remoteOrders);
    } on ServerException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
