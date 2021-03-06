import 'package:equatable/equatable.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:home_x_client/core/usecases/usecase.dart';
import 'package:home_x_client/src/orders/domain/entities/order.dart';
import 'package:home_x_client/src/orders/domain/repositories/orders_repository.dart';

class AllOrders implements UseCase<List<Orders>, AllOrdersParams> {
  final OrdersRepository repository;

  AllOrders(this.repository);

  @override
  Future<Either<Failure, List<Orders>>> call(params) async {
    return await repository.getOrders(clientID: params.pk);
  }
}

class AllOrdersParams extends Equatable {
  final String pk;

  AllOrdersParams({required this.pk});

  @override
  List<Object> get props => [pk];
}
