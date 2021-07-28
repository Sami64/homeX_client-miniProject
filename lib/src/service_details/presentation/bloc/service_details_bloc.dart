import 'package:home_x_client/core/service/data/models/service_model.dart';
import 'package:home_x_client/core/service/domain/entities/service.dart';
import 'package:home_x_client/core/service/domain/usecases/category_services.dart';
import 'package:home_x_client/core/service/domain/usecases/service_details.dart';

class ServiceDetailsBloc {
  final CategoryServices categoryServices;
  final ServiceDetails serviceDetails;

  ServiceDetailsBloc(
      {required this.categoryServices, required this.serviceDetails});

  Stream<List<Service>> categoryServicesList({required String pk}) async* {
    final failureOrServices =
        await categoryServices(CategoryServicesParams(pk: pk));
    yield* failureOrServices.fold((l) async* {
      yield <Service>[];
    }, (services) async* {
      yield services;
    });
  }

  Stream<Service> details({required String pk}) async* {
    final failureOrService = await serviceDetails(ServiceDetailsParams(pk: pk));
    yield* failureOrService.fold((l) async* {
      yield ServiceModel.initial();
    }, (service) async* {
      yield service;
    });
  }
}
