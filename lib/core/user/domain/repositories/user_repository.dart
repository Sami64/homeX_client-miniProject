import 'package:dartz/dartz.dart';
import 'package:home_x_client/core/errors/failures.dart';
import 'package:home_x_client/core/user/domain/entities/user.dart';

abstract class UserRepository {
  /// Create User with Email
  Future<Either<Failure, User>> signUp(
      {required String email,
      required String name,
      required String password,
      required String residentialAddress,
      required String phoneNumber});

  /// Authenticates user
  Future<Either<Failure, User>> login(
      {required String name, required String password});

  Future<Either<Failure, User>> logout();

  // Future<Either<Failure, Otp>> getOtp(
  //     {required String number, required String name, required String token});

  /// Get User Data
  Future<Either<Failure, User>> userData(bool localUser);
}
