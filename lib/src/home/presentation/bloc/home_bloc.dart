import 'package:home_x_client/core/service/domain/entities/category.dart';
import 'package:home_x_client/core/service/domain/usecases/all_services.dart';
import 'package:home_x_client/core/usecases/usecase.dart';

class HomeBloc {
  final AllServices allServices;

  HomeBloc({required this.allServices});

  Stream<List<Category>> services() async* {
    final failureOrServices = await allServices(NoParams());
    yield* failureOrServices.fold((l) async* {
      yield <Category>[];
    }, (serviceCategories) async* {
      yield serviceCategories;
    });
  }

}
