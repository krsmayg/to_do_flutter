import 'package:flutter/material.dart';
import 'package:to_do_app/pages/aboutPage.dart';
import 'package:to_do_app/pages/homePage.dart';
import 'package:to_do_app/pages/settingsPage.dart';
import 'package:to_do_app/widgets/reusableWidgets.dart';
import './main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case '/settings/about':
        return MaterialPageRoute(builder: (_) => AboutPage());

      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      body: Center(
        child: Text('Error'),
      ),
    );
  });
}
