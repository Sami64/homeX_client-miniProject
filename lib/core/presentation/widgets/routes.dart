import 'package:flutter/material.dart';
import 'package:home_x_client/src/home/presentation/pages/home_page.dart';
import 'package:home_x_client/src/service_details/presentation/pages/service_details_page.dart';
import 'package:home_x_client/src/service_details/presentation/pages/service_list_page.dart';

class Routes {
  static const String home = '/home';
  static const String explore = '/explore';
  static const String orders = '/orders';
  static const String details = '/details';
  static const String services = '/services';

  static final Map<String, WidgetBuilder> routes = {
    Routes.home: (BuildContext context) => HomePage(),
    Routes.details: (BuildContext context) => ServiceDetailsPage(),
    Routes.services: (BuildContext context) => ServiceListPage()
  };
}
