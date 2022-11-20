import 'package:flutter/material.dart';
import 'package:locate_app/login.dart';
import 'home.dart';
import 'roll_favorite.dart';
import 'roll_familiar.dart';
import 'filter.dart';

import 'constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case filterRoute:
        return MaterialPageRoute(builder: (_) => FilterPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case roll1Route:
        return MaterialPageRoute(builder: (_) => RollFavoritePage());
      case roll2Route:
        return MaterialPageRoute(builder: (_) => RollFamiliarPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
