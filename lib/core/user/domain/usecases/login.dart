import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/core/usecases/usecase.dart';
import 'package:home_x_client/core/user/domain/entities/user.dart';
import 'package:home_x_client/core/user/domain/repositories/user_repository.dart';

class Login implements UseCase<User, LoginParams> {
  final UserRepository repository;
  Login(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(
        name: params.username, password: params.password);
  }
}

class LoginParams extends Equatable {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
