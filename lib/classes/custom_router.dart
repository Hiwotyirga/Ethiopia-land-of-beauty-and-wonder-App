import 'package:exhange_rates_flutter/classes/route_constants.dart';
import 'package:flutter/material.dart';
import '../utils/New.dart';
import 'home_page.dart';
import 'not_found_page.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      // case settingsRoute:
      //   return MaterialPageRoute(builder: (_) => const SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
