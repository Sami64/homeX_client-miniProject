import 'package:home_x_client/core/errors/exception.dart';
import 'package:home_x_client/core/platform/network_info.dart';
import 'package:home_x_client/src/explore/data/database/explore_remote_database.dart';
import 'package:home_x_client/src/explore/domain/entities/nearby_service.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:home_x_client/src/explore/domain/repositories/explore_repository.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final NetworkInfo networkInfo;
  final ExploreRemoteDatabase remoteDatabase;

  ExploreRepositoryImpl(
      {required this.networkInfo, required this.remoteDatabase});

  @override
  Future<Either<Failure, List<NearbyService>>> nearbyServices() async {
    try {
      await networkInfo.hasInternet();
      final remoteNearbyServices = await remoteDatabase.nearbyServicesRequest();
      return Right(remoteNearbyServices);
    } on ServerException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
