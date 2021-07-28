import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/core/usecases/usecase.dart';
import 'package:home_x_client/core/user/domain/entities/user.dart';
import 'package:home_x_client/core/user/domain/repositories/user_repository.dart';

class SignUp implements UseCase<User, SignUpParams> {
  final UserRepository repository;

  SignUp(this.repository);

  @override
  Future<Either<Failure, User>> call(SignUpParams params) async {
    return await repository.signUp(
        email: params.email,
        name: params.name,
        residentialAddress: params.residentialAddress,
        password: params.password,
        phoneNumber: params.phoneNumber);
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String name;
  final String password;
  final String phoneNumber;
  final String residentialAddress;

  SignUpParams(
      {required this.email,
      required this.name,
      required this.phoneNumber,
      required this.residentialAddress,
      required this.password});

  @override
  List<Object> get props =>
      [email, name, password, phoneNumber, residentialAddress];
}
