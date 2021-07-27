import 'package:equatable/equatable.dart';

class Orders extends Equatable {
  final String pk;
  final String orderID;

  Orders({required this.pk, required this.orderID});

  @override
  List<Object> get props => [pk, orderID];
}
