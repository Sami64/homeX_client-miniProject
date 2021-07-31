import 'package:home_x_client/core/usecases/usecase.dart';
import 'package:home_x_client/src/explore/domain/entities/nearby_service.dart';
import 'package:home_x_client/src/explore/domain/usecases/nearby_services.dart';

class ExploreBloc {
  final NearbyServices nearbyServices;

  ExploreBloc({required this.nearbyServices});

  Future<List<NearbyService>> getNearbyServices() async {
    final failureOrServices = await nearbyServices(NoParams());
    return failureOrServices.fold(
        (l) => <NearbyService>[], (services) => services);
  }
  
}
