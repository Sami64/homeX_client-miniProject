import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/core/service/domain/entities/service.dart';
import 'package:home_x_client/core/service/domain/repositories/service_repository.dart';
import 'package:home_x_client/core/usecases/usecase.dart';

class CategoryServices implements UseCase<List<Service>, CategoryServicesParams> {

  ServiceRepository repository;

  CategoryServices(this.repository);

  @override
  Future<Either<Failure, List<Service>>> call(CategoryServicesParams params) async {
    return await repository.categoryServices(pk: params.pk);
  }

}

class CategoryServicesParams extends Equatable{
  final String pk;

  CategoryServicesParams({required this.pk});

  @override 
  List<Object> get props => [pk];

}