import 'package:flutter/material.dart';

class ReusableWidgets {
  BuildContext context;
  ReusableWidgets(this.context);
  getAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/settings');
          },
          icon: Icon(
            Icons.settings,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  getBottomNav() {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
    ]);
  }
}
