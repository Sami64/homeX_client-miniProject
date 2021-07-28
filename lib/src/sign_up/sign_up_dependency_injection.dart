import 'package:home_x_client/src/sign_up/presentation/bloc/sign_up_bloc.dart';

import '../../injection_container.dart';

void initSignup() {
  sl.registerFactory(() => SignupBloc(signUp: sl()));
}
