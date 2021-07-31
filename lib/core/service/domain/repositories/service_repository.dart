import 'package:dartz/dartz.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/core/service/domain/entities/category.dart';
import 'package:home_x_client/core/service/domain/entities/service.dart';

abstract class ServiceRepository {
  Future<Either<Failure, List<Category>>> allServices();

  Future<Either<Failure, List<Service>>> categoryServices({required String pk});

  Future<Either<Failure, Service>> serviceDetails({required String pk});

  Future<Either<Failure, Service>> completeService({required String orderNo});
}
