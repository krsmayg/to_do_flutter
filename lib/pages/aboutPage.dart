import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/reusableWidgets.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: ReusableWidgets(context).getAppBar('About'),
        body: Column(
          children: <Widget>[
            Container(
              child: Text('Version 1.0',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
