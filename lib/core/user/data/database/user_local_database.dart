import 'package:hive/hive.dart';
import 'package:home_x_client/core/errors/exception.dart';
import 'package:home_x_client/core/user/data/database/user_hive_database.dart';
import 'package:home_x_client/core/user/data/models/user_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'user_hive_database.dart';

abstract class UserLocalDatabase {
  /// Retrieves [UserModel] from [UserHiveLocalDatabase]
  Future<UserModel> user();

  /// Cache [UserModel] to [UserHiveLocalDatabase]
  Future<void> cacheUser(
      {required UserModel userToCache, required bool authState});

  /// Retrieves [UserHiveLocalDatabase.authenticationState]
  Future<bool> authenticationStatus();

  /// Logout user
  Future<void> clearUser();
}

class UserLocalDatabaseImpl implements UserLocalDatabase {
  final HiveInterface hiveInterface;

  /// Box Name
  static const String _boxName = 'user';

  UserLocalDatabaseImpl(this.hiveInterface) {
    hiveInterface.registerAdapter(UserHiveLocalDatabaseAdapter());
  }

  /// Return User from box
  Future<UserHiveLocalDatabase?> get _userBox async {
    try {
      final userBox =
          await hiveInterface.openBox<UserHiveLocalDatabase>(_boxName);
      return userBox.get(0) ??
          UserHiveLocalDatabase.fromUser(
              model: UserModel.initial(), authState: false);
    } catch (error) {
      hiveInterface.deleteBoxFromDisk(_boxName);
      return _userBox;
    }
  }

  @override
  Future<bool> authenticationStatus() async {
    try {
      final user = await _userBox;
      return user!.authenticationStatus;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<UserModel> user() async {
    try {
      final user = await _userBox;
      return user!.toUser();
    } catch (error) {
      throw DeviceException("Insufficient storage space");
    }
  }

  @override
  Future<void> cacheUser(
      {required UserModel userToCache, required bool authState}) async {
    try {
      final box = await hiveInterface.openBox<UserHiveLocalDatabase>(_boxName);
      final localUser = UserHiveLocalDatabase.fromUser(
          model: userToCache, authState: authState);
      box.put(0, localUser);
    } catch (error) {
      throw DeviceException('Insufficent storage space');
    }
  }

  @override
  Future<void> clearUser() async {
    try {
      final box = await hiveInterface.openBox<UserHiveLocalDatabase>(_boxName);
      box.clear();
    } catch (error) {
      throw DeviceException('message');
    }
  }
}
