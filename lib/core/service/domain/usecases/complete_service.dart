import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/core/service/domain/entities/service.dart';
import 'package:home_x_client/core/service/domain/repositories/service_repository.dart';
import 'package:home_x_client/core/usecases/usecase.dart';

class CompleteService implements UseCase<Service, CompleteServiceParams> {
  final ServiceRepository repository;
  CompleteService(this.repository);

  @override
  Future<Either<Failure, Service>> call(CompleteServiceParams params) async {
    return await repository.completeService(orderNo: params.orderNo);
  }
}

class CompleteServiceParams extends Equatable {
  final String orderNo;

  CompleteServiceParams({required this.orderNo});

  @override
  List<Object> get props => [orderNo];
}
