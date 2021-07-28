import 'package:home_x_client/core/user/domain/usecases/login.dart';

class LoginBloc {
  final Login login;

  LoginBloc({required this.login});

  Future<String> loginUser(
      {required String email, required String password}) async {
    final failureOrUser =
        await login(LoginParams(username: email, password: password));
    return failureOrUser.fold((error) => error.toString(), (r) => '');
  }
}
