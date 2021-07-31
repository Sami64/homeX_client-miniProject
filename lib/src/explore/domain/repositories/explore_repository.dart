import 'package:dartz/dartz.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/src/explore/domain/entities/nearby_service.dart';
import 'package:home_x_client/src/explore/domain/entities/nearby_service.dart';

abstract class ExploreRepository {
  Future<Either<Failure, List<NearbyService>>> nearbyServices();
}
