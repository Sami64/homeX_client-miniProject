import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String name;
  final String phoneNumber;
  final String residentialAddress;
  final String token;
  final String image;

  User(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.residentialAddress,
      required this.image,
      required this.token});

  factory User.initial() => User(
      name: 'Sami Khae',
      email: '',
      token: '',
      image: '',
      phoneNumber: '',
      residentialAddress: '');

  @override
  List<Object> get props =>
      [name, email, phoneNumber, token, residentialAddress, image];
}
