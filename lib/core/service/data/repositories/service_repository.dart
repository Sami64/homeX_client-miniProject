import 'package:dartz/dartz.dart';
import 'package:home_x_client/core/errors/exception.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/core/platform/network_info.dart';
import 'package:home_x_client/core/service/data/database/service_remote_database.dart';
import 'package:home_x_client/core/service/domain/entities/category.dart';
import 'package:home_x_client/core/service/domain/entities/service.dart';
import 'package:home_x_client/core/service/domain/repositories/service_repository.dart';

class ServiceRepositoryImpl extends ServiceRepository {
  final NetworkInfo networkInfo;
  final ServiceRemoteDatabase remoteDatabase;

  ServiceRepositoryImpl(
      {required this.networkInfo, required this.remoteDatabase});

  @override
  Future<Either<Failure, List<Category>>> allServices() async {
    try {
      await networkInfo.hasInternet();
      final remoteServices = await remoteDatabase.allServicesRequest();
      return Right(remoteServices);
    } on ServerException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, Service>> serviceDetails({required String pk}) async {
    try {
      await networkInfo.hasInternet();
      final service = await remoteDatabase.serviceDetailRequest(pk: pk);
      return Right(service);
    } on ServerException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, List<Service>>> categoryServices(
      {required String pk}) async {
    try {
      await networkInfo.hasInternet();
      final remoteCategoryServices =
          await remoteDatabase.categoryServicesRequest(pk: pk);
      return Right(remoteCategoryServices);
    } on ServerException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
