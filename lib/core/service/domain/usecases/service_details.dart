import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/core/service/domain/entities/service.dart';
import 'package:home_x_client/core/service/domain/repositories/service_repository.dart';
import 'package:home_x_client/core/usecases/usecase.dart';

class ServiceDetails implements UseCase<Service, ServiceDetailsParams> {
  final ServiceRepository repository;

  ServiceDetails(this.repository);

  @override
  Future<Either<Failure, Service>> call(ServiceDetailsParams params) async {
    return await repository.serviceDetails(pk: params.pk);
  }
}

class ServiceDetailsParams extends Equatable {
  final String pk;

  ServiceDetailsParams({required this.pk});

  List<Object> get props => [pk];
}
