import 'package:home_x_client/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:home_x_client/core/service/domain/entities/category.dart';
import 'package:home_x_client/core/service/domain/entities/service.dart';
import 'package:home_x_client/core/service/domain/repositories/service_repository.dart';
import 'package:home_x_client/core/usecases/usecase.dart';

class AllServices implements UseCase<List<Category>, NoParams> {
  final ServiceRepository repository;
  AllServices(this.repository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await repository.allServices();
  }
}
