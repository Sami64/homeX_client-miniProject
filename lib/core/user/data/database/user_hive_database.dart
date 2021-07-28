import 'package:hive/hive.dart';
import 'package:home_x_client/core/data/hive_adapters.dart';
import 'package:home_x_client/core/user/data/models/user_model.dart';

part 'user_hive_database.g.dart';

@HiveType(typeId: RegisterAdapters.user)
class UserHiveLocalDatabase extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String phoneNumber;
  @HiveField(2)
  String email;
  @HiveField(3)
  String token;
  @HiveField(4)
  bool authenticationStatus = false;
  @HiveField(5)
  String residentialAddress;

  UserHiveLocalDatabase(
      {required this.name,
      required this.token,
      required this.authenticationStatus,
      required this.phoneNumber,
      required this.residentialAddress,
      required this.email});

  factory UserHiveLocalDatabase.fromUser(
          {required UserModel model, required bool authState}) =>
      UserHiveLocalDatabase(
          name: model.name,
          token: model.token,
          authenticationStatus: authState,
          phoneNumber: model.phoneNumber,
          residentialAddress: model.residentialAddress,
          email: model.email);

  UserModel toUser() => UserModel(
      email: email,
      token: token,
      name: name,
      phoneNumber: phoneNumber,
      image: '',
      residentialAddress: residentialAddress);
}
