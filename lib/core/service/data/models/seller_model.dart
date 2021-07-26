import 'package:home_x_client/core/service/domain/entities/seller.dart';

class SellerModel extends Seller {
  SellerModel(
      {required String email, required String name, required String phone})
      : super(email: email, phone: phone, name: name);

  factory SellerModel.fromJson(Map<String, dynamic> json) {
    return SellerModel(
        email: json['selleremail'],
        name: json['sellername'],
        phone: json['sellerphone']);
  }
}
