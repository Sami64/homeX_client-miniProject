import 'package:flutter/material.dart';
import 'package:home_x_client/core/presentation/widgets/routes.dart';
import 'package:home_x_client/src/home/presentation/pages/main_page.dart';

Future<void> main() async {
  runApp(MaterialApp(
    title: 'Home X Client',
    routes: Routes.routes,
    home: MainPage(),
  ));
}
