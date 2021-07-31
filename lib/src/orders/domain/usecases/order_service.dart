import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/core/usecases/usecase.dart';
import 'package:home_x_client/src/orders/domain/entities/order.dart';
import 'package:home_x_client/src/orders/domain/repositories/orders_repository.dart';

class OrderService implements UseCase<Orders, OrderServiceParams> {
  final OrdersRepository repository;

  OrderService(this.repository);

  @override
  Future<Either<Failure, Orders>> call(OrderServiceParams params) async {
    return await repository.orderService(
        clientID: params.clientpk, serviceID: params.servicepk);
  }
}

class OrderServiceParams extends Equatable {
  final String clientpk;
  final String servicepk;

  OrderServiceParams({required this.clientpk, required this.servicepk});

  @override
  List<Object> get props => [clientpk, servicepk];
}
