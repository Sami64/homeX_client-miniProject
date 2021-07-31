import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/core/usecases/usecase.dart';
import 'package:home_x_client/src/orders/domain/entities/order.dart';
import 'package:home_x_client/src/orders/domain/repositories/orders_repository.dart';

class CompletedOrders implements UseCase<List<Orders>, CompletedOrdersParams> {
  final OrdersRepository repository;
  CompletedOrders(this.repository);

  @override
  Future<Either<Failure, List<Orders>>> call(
      CompletedOrdersParams params) async {
    return await repository.getOrdersCompleted(clientID: params.pk);
  }
}

class CompletedOrdersParams extends Equatable {
  final String pk;
  CompletedOrdersParams({required this.pk});

  @override
  List<Object> get props => [pk];
}
