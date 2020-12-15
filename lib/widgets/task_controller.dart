import 'dart:math';
import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/toDoModel.dart';
import '../models/imageModel.dart';
import './task_title.dart';
import './task_list.dart';
import 'package:http/http.dart' as http;

class TaskController extends StatefulWidget {
  @override
  _TaskControllerState createState() => _TaskControllerState();
}

class _TaskControllerState extends State<TaskController> {
  List<ImageModel> images = new List();
  bool loading = false;
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
  getImages() async {
    setState(() => loading = true);
    var url =
        'https://api.unsplash.com/search/photos?per_page=30&client_id=896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043&query=people';

    var res = await http.get(url);
    if (res.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(res.body);
      jsonData["results"].forEach((el) {
        ImageModel imageModel = new ImageModel();
        imageModel = ImageModel.fromMap(el);
        images.add(imageModel);
        setState(() => loading = false);
      });
    } else {
      print('Data did not load');
    }
    setState(() {});
  }

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
