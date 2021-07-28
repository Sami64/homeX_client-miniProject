import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:home_x_client/core/presentation/widgets/routes.dart';
import 'package:home_x_client/core/user/data/database/user_local_database.dart';
import 'package:home_x_client/src/home/presentation/pages/main_page.dart';
import 'package:home_x_client/src/login/presentation/pages/sign_in_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  di.init();
  bool authState = await di.sl<UserLocalDatabase>().authenticationStatus();
  runApp(MaterialApp(
    title: 'Home X Client',
    routes: Routes.routes,
    home: authState ? MainPage() : SignInScreen(),
  ));
}
