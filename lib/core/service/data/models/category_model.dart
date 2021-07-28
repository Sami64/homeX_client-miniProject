import 'package:home_x_client/core/service/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel(
      {required String key,
      required String name,
      required String description,
      required String image})
      : super(
            key: key,
            categoryName: name,
            categoryDescription: description,
            categoryImage: image);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        key: json['categoriespk'].toString(),
        name: json['categoryname'],
        description: json['categorydescription'],
        image: json['image']);
  }
}
