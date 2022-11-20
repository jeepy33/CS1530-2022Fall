import 'package:flutter/material.dart';
import 'main.dart';

import 'constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case filterRoute:
        return MaterialPageRoute(builder: (_) => FilterPage());
      case roll1Route:
        return MaterialPageRoute(builder: (_) => Roll1Page());
      case roll2Route:
        return MaterialPageRoute(builder: (_) => Roll2Page());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
