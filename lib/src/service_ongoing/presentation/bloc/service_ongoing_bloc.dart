import 'package:home_x_client/core/service/domain/usecases/complete_service.dart';

class ServiceOngoingBloc {
  final CompleteService completeService;

  ServiceOngoingBloc({required this.completeService});

  Future<String> completeUserService(String orderNo) async {
    final failureOrService =
        await completeService(CompleteServiceParams(orderNo: orderNo));
    return failureOrService.fold((l) => l.toString(), (service) => '');
  }
}
