import 'package:home_x_client/core/service/domain/entities/seller.dart';

class SellerModel extends Seller {
  SellerModel(
      {required String email,
      required String name,
      required String phone,
      required String address,
      required String qualification})
      : super(
            email: email,
            phone: phone,
            name: name,
            address: address,
            qualification: qualification);

  factory SellerModel.fromJson(Map<String, dynamic> json) {
    return SellerModel(
        email: json.containsKey('sellerEmail') ? json['sellerEmail'] : '',
        address: json.containsKey('sellerAddress') ? json['sellerAddress'] : '',
        qualification: json.containsKey('sellerQualification')
            ? json['sellerQualification']
            : '',
        name: json.containsKey('sellerName') ? json['sellerName'] : '',
        phone: json.containsKey('sellerPhone') ? json['sellerPhone'] : '');
  }

  factory SellerModel.initial() => SellerModel(
      email: 'email',
      name: 'name',
      phone: 'phone',
      address: '',
      qualification: '');
}
