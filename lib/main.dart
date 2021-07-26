import 'package:flutter/material.dart';
import 'package:home_x_client/core/presentation/widgets/routes.dart';
import 'package:home_x_client/src/home/presentation/pages/main_page.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(MaterialApp(
    title: 'Home X Client',
    routes: Routes.routes,
    home: MainPage(),
  ));
}
