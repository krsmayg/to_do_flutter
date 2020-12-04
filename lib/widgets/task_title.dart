import 'package:flutter/material.dart';
import 'package:to_do_app/models/toDoModel.dart';

class TaskTitle extends StatelessWidget {
  final List<ToDo> toDos;
  TaskTitle(this.toDos);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Text('Your Tasks',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        Container(
          child: Text('You have ${toDos.length} tasks for today',
              style: TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}
