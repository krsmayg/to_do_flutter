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
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   fontFamily: 'Quicksand',
      //   textTheme: ThemeData.dark().textTheme.copyWith(
      //         title: TextStyle(
      //             fontFamily: 'OpenSans',
      //             fontSize: 18,
      //             fontWeight: FontWeight.bold),
      //       ),
      //   appBarTheme: AppBarTheme(
      //     textTheme: ThemeData.dark().textTheme.copyWith(
      //           title: TextStyle(
      //               fontFamily: 'OpenSans',
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold),
      //         ),
      //   ),
      // ),
      themeMode: ThemeMode.light,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
