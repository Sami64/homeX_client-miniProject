import 'package:equatable/equatable.dart';

class Seller extends Equatable {
  final String name;
  final String email;
  final String phone;

  Seller(
      {
      required this.email,
      required this.name,
      required this.phone});

  @override
  List<Object> get props => [ name, email, phone];
}
