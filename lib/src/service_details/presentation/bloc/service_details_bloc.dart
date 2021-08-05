import 'package:home_x_client/core/service/data/models/service_model.dart';
import 'package:home_x_client/core/service/domain/entities/service.dart';
import 'package:home_x_client/core/service/domain/usecases/category_services.dart';
import 'package:home_x_client/core/service/domain/usecases/service_details.dart';
import 'package:home_x_client/core/usecases/usecase.dart';
import 'package:home_x_client/core/user/domain/usecases/user_data.dart';
import 'package:home_x_client/src/orders/domain/usecases/order_service.dart';

class ServiceDetailsBloc {
  final CategoryServices categoryServices;
  final ServiceDetails serviceDetails;
  final OrderService orderService;
  final UserData userData;

  ServiceDetailsBloc(
      {required this.categoryServices,
      required this.serviceDetails,
      required this.userData,
      required this.orderService});

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

  Future<String> userToken() async {
    final failureOrToken = await userData(UserDataParams());
    return await failureOrToken.fold((l) => l.toString(), (user) => user.token);
  }

  Future<String> placeServiceOrder({required String serviceID}) async {
    final _clientpk = await userToken();
    print("THE SERVICEID: $serviceID");
    final failureOrOrder = await orderService(
        OrderServiceParams(clientpk: _clientpk, servicepk: serviceID));
    return await failureOrOrder.fold((l) => l.toString(), (order) => '');
  }
}
