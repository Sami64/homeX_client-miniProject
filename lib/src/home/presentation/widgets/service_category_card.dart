import 'package:flutter/material.dart';
import 'package:home_x_client/core/data/images_data.dart';

class ServiceCategoryCard extends StatelessWidget {
  const ServiceCategoryCard(
      {Key? key,
      required this.onTap,
      required this.categoryImage,
      required this.categoryName})
      : super(key: key);
  final VoidCallback onTap;
  final String categoryName, categoryImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                  image: FadeInImage(
                    image: NetworkImage(categoryImage),
                    placeholder: AssetImage(Images.ps4),
                  ).image)),
          child: Center(
              child: Text(
            categoryName,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.08),
          )),
        ),
      ),
    );
  }
}
