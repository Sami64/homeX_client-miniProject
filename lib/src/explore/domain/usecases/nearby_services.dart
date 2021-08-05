import 'package:home_x_client/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:home_x_client/core/usecases/usecase.dart';
import 'package:home_x_client/src/explore/domain/entities/nearby_service.dart';
import 'package:home_x_client/src/explore/domain/repositories/explore_repository.dart';

class NearbyServices implements UseCase<List<NearbyService>, NoParams> {
  final ExploreRepository repository;
  NearbyServices(this.repository);

  @override
  Future<Either<Failure, List<NearbyService>>> call(NoParams params) async {
    return await repository.nearbyServices();
  }
}
