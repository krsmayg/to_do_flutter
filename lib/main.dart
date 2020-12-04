import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:to_do_app/route_generator.dart';
import './widgets/task_controller.dart';
import './pages/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: '/',
      theme: ThemeData(fontFamily: 'Poppins'),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
