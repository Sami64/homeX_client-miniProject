import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String key;
  final String categoryName;
  final String categoryDescription;
  final String categoryImage;

  Category(
      {required this.key,
      required this.categoryName,
      required this.categoryDescription,
      required this.categoryImage});

  @override
  List<Object> get props =>
      [key, categoryName, categoryDescription, categoryImage];
}
