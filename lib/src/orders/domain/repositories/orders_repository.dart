import 'package:dartz/dartz.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/src/orders/domain/entities/order.dart';

abstract class OrdersRepository {
  Future<Either<Failure, List<Orders>>> getOrders({required String clientID});

  Future<Either<Failure, Orders>> orderService({required String clientID, required String serviceID});
}
