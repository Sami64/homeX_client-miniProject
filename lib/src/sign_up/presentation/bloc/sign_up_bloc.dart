import 'package:home_x_client/core/user/domain/usecases/sign_up.dart';

class SignupBloc {
  final SignUp signUp;

  SignupBloc({required this.signUp});

  Future<String?> signupUser(
      {required String email,
      required String password,
      required String name,
      required String phoneNumber,
      required String address}) async {
    print("NAME IN BLOC $name");
    final failureOrUser = await signUp(SignUpParams(
        email: email,
        password: password,
        name: name,
        phoneNumber: phoneNumber,
        residentialAddress: address));
    return failureOrUser.fold((error) => error.toString(), (r) => null);
  }
}
