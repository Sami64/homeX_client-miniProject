import 'package:home_x_client/injection_container.dart';
import 'package:home_x_client/src/login/presentation/bloc/login_bloc.dart';

void initLogin() {
  // Bloc
  sl.registerFactory(() => LoginBloc(login: sl()));
}
