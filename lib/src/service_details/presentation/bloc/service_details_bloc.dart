import 'package:home_x_client/core/service/domain/entities/service.dart';
import 'package:home_x_client/core/service/domain/usecases/category_services.dart';

class ServiceDetailsBloc {
  final CategoryServices categoryServices;

  ServiceDetailsBloc({required this.categoryServices});

  Stream<List<Service>> categoryServicesList({required String pk}) async* {
    final failureOrServices =
        await categoryServices(CategoryServicesParams(pk: pk));
    yield* failureOrServices.fold((l) async* {
      yield <Service>[];
    }, (services) async* {
      yield services;
    });
  }
  
}
