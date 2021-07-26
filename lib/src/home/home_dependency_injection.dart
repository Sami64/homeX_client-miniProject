import 'package:home_x_client/src/home/presentation/bloc/home_bloc.dart';
import 'package:home_x_client/injection_container.dart';

void initHome() {
  sl.registerFactory(() => HomeBloc(allServices: sl()));
}
