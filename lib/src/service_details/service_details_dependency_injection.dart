import 'package:home_x_client/injection_container.dart';
import 'package:home_x_client/src/service_details/presentation/bloc/service_details_bloc.dart';

void initServiceDetails() {
  // Bloc
  sl.registerFactory(
      () => ServiceDetailsBloc(categoryServices: sl(), serviceDetails: sl(), orderService: sl(), userData: sl()));

  // Usecase

  // Repositories

  // Database
}
