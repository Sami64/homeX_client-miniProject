import 'package:home_x_client/core/user/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required String email,
      required String token,
      required String name,
      required String image,
      required String residentialAddress,
      required String phoneNumber})
      : super(
            email: email,
            name: name,
            phoneNumber: phoneNumber,
            token: token,
            image: image,
            residentialAddress: residentialAddress);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        token: json['clientpk'].toString(),
        image: json.containsKey('image') ? json['image'] : '',
        name: json['clientname'],
        residentialAddress: json['address'],
        phoneNumber: json['phoneno']);
  }

  factory UserModel.initial() => UserModel(
      email: '',
      token: '',
      name: '',
      residentialAddress: '',
      phoneNumber: '',
      image: '');
}
