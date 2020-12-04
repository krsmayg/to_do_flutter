import 'dart:math';

import 'package:flutter/material.dart';
import '../models/toDoModel.dart';
import './task_title.dart';
import './task_list.dart';

class TaskController extends StatefulWidget {
  @override
  _TaskControllerState createState() => _TaskControllerState();
}

class _TaskControllerState extends State<TaskController> {
  List<ToDo> _toDos = [
    ToDo(
        id: 't1',
        task: 'Go to the store',
        date: DateTime.now(),
        tag: new Tag('activity', '#27ae60')),
    ToDo(
        id: 't2',
        task: 'Learn Mobile dev',
        date: DateTime.now(),
        tag: new Tag('work', '#2980b9')),
    ToDo(
        id: 't3',
        task: 'Clean house',
        date: DateTime.now(),
        tag: new Tag('house', '#e74c3c')),
    ToDo(
        id: 't4',
        task: 'English',
        date: DateTime.now(),
        tag: new Tag('work', '#2980b9')),
    ToDo(
        id: 't5',
        task: 'walk in a park',
        date: DateTime.now(),
        tag: new Tag('rest', '#f1c40f')),
  ];
  void _setCheckMark(ToDo item) {
    var index = _toDos.indexOf(item);
    setState(() {
      _toDos[index] = ToDo(
          id: item.id,
          task: item.task,
          date: item.date,
          tag: item.tag,
          checked: !item.checked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TaskTitle(this._toDos),
        TaskList(this._toDos, _setCheckMark),
      ],
    );
  }
}
