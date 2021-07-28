import 'package:flutter/material.dart';
import 'package:home_x_client/src/home/presentation/pages/home_page.dart';
import 'package:home_x_client/src/home/presentation/pages/main_page.dart';
import 'package:home_x_client/src/login/presentation/pages/sign_in_screen.dart';
import 'package:home_x_client/src/service_details/presentation/pages/service_details_page.dart';
import 'package:home_x_client/src/service_details/presentation/pages/service_list_page.dart';
import 'package:home_x_client/src/sign_up/presentation/pages/sign_up_screen.dart';

class Routes {
  static const String home = '/home';
  static const String explore = '/explore';
  static const String orders = '/orders';
  static const String details = '/details';
  static const String services = '/services';
  static const String signup = '/signup';
  static const String login = '/login';
  static const String main = '/main';

  static final Map<String, WidgetBuilder> routes = {
    Routes.home: (BuildContext context) => HomePage(),
    Routes.details: (BuildContext context) => ServiceDetailsPage(),
    Routes.services: (BuildContext context) => ServiceListPage(),
    Routes.signup: (BuildContext context) => SignUpScreen(),
    Routes.login: (BuildContext context) => SignInScreen(),
    Routes.main: (BuildContext context) => MainPage()
  };
}
