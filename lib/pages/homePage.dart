import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../widgets/task_controller.dart';
import '../widgets/reusableWidgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    print('***init state***');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    print('***dispose***');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = ${state.toString()}');

    switch (state) {
      case AppLifecycleState.inactive:
        print('***inactive***');
        break;
      case AppLifecycleState.paused:
        print('***paused***');
        break;
      case AppLifecycleState.resumed:
        print('***resumed***');
        break;
      case AppLifecycleState.detached:
        print('***detached***');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            HexColor('#EAE5D4'),
          ], // red to yellow
          stops: [0.0, 1.0],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: ReusableWidgets(context).getAppBar('Home'),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 40),
                child: Text(
                  'Hello User!',
                  style: TextStyle(fontSize: 36),
                ),
              ),
              TaskController()
            ],
          ),
          bottomNavigationBar: ReusableWidgets(context).getBottomNav()),
    );
  }
}
