import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/core/usecases/usecase.dart';
import 'package:home_x_client/core/user/domain/entities/user.dart';
import 'package:home_x_client/core/user/domain/repositories/user_repository.dart';

class UserData implements UseCase<User, UserDataParams> {
  final UserRepository repository;

  UserData(this.repository);

  @override
  Future<Either<Failure, User>> call(UserDataParams params) async {
    return await repository.userData(params.localUser);
  }
}

class UserDataParams extends Equatable {
  final bool localUser;

  UserDataParams({this.localUser: true,});

  @override
  List<Object> get props => [localUser, ];
}
