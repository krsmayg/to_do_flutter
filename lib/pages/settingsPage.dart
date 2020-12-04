import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/reusableWidgets.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: ReusableWidgets(context).getAppBar('Settings'),
        body: Column(
          children: <Widget>[
            Container(
              width: 400,
              height: 60,
              child: RaisedButton(
                color: Colors.white,
                child: Text('About'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/settings/about');
                },
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey[350], width: 1)),
              ),
            ),
            Container(
              width: 400,
              height: 60,
              child: RaisedButton(
                color: Colors.white,
                child: Text('Terms of use'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/settings/about');
                },
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey[350], width: 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//terms of use
