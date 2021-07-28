import 'package:home_x_client/core/errors/exception.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/core/platform/network_info.dart';
import 'package:home_x_client/core/user/data/database/user_local_database.dart';
import 'package:home_x_client/core/user/data/database/user_remote_database.dart';
import 'package:home_x_client/core/user/data/models/user_model.dart';
import 'package:home_x_client/core/user/domain/entities/user.dart';
import 'package:home_x_client/core/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDatabase remoteDatabase;
  final UserLocalDatabase localDatabase;

  UserRepositoryImpl(
      {required this.networkInfo,
      required this.remoteDatabase,
      required this.localDatabase});

  Future<Either<Failure, User>> _request(
      Future<UserModel> request(
    String token,
  ),
      {bool localData: false,
      required Future<bool> authState}) async {
    try {
      final user = await localDatabase.user();
      if (localData) return Right(user);
      await networkInfo.hasInternet();
      final remoteUser = await request(user.token);
      print("USER TOKEN ${user.token}");
      localDatabase.cacheUser(
          userToCache: remoteUser, authState: await authState);
      return Right(remoteUser);
    } on ServerException catch (error) {
      if (error.statusCode == 401) {
        localDatabase.cacheUser(
            userToCache: UserModel.initial(), authState: false);
        return Right(User.initial());
      }
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, User>> login(
          {required String name, required String password}) =>
      _request(
          (token) =>
              remoteDatabase.loginRequest(name: name, password: password),
          authState: Future.value(true),
          localData: false);

  @override
  Future<Either<Failure, User>> signUp(
          {required String email,
          required String name,
          required String password,
          required String residentialAddress,
          required String phoneNumber}) =>
      _request(
          (token) => remoteDatabase.signUpRequest(
              name: name,
              email: email,
              password: password,
              phoneNumber: phoneNumber,
              residentialAddress: residentialAddress),
          authState: Future.value(true));

  @override
  Future<Either<Failure, User>> userData(
    bool localUser,
  ) =>
      _request((token) => remoteDatabase.userDataRequest(token: token),
          authState: localDatabase.authenticationStatus());

  @override
  Future<Either<Failure, User>> logout() async {
    try {
      await localDatabase.clearUser();
      return Right(UserModel.initial());
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
