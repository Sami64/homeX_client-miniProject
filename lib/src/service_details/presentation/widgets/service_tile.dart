import 'package:flutter/material.dart';

class ServiceTile extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;
  const ServiceTile(
      {Key? key,
      required this.title,
      required this.description,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(15.0)),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        onTap: onTap,
      ),
    );
  }
}
