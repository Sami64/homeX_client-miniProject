import 'dart:convert';

import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  String toString() => _utf8Convert(message);

  static String _utf8Convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }

  @override
  List<Object> get props => [message];
}
