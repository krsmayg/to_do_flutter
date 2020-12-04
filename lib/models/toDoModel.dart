import 'package:flutter/foundation.dart';

class ToDo {
  final String id;
  final String task;
  final DateTime date;
  final Tag tag;
  bool checked;
  ToDo({
    @required this.id,
    @required this.task,
    this.date,
    this.tag,
    this.checked = false,
  });
}

class Tag {
  final String name;
  final String color;

  Tag(this.name, this.color);
}
