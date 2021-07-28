import 'package:equatable/equatable.dart';

class Seller extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String qualification;
  final String address;

  Seller({required this.email, required this.name, required this.phone, required this.address, required this.qualification});

  @override
  List<Object> get props => [name, email, phone, address, qualification];
}
