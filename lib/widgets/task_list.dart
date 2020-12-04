import 'package:flutter/material.dart';
import '../models/toDoModel.dart';
import 'package:hexcolor/hexcolor.dart';

class TaskList extends StatelessWidget {
  final List<ToDo> toDos;
  final Function _setCheckMark;
  TaskList(this.toDos, this._setCheckMark);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
            children: toDos.map((todo) {
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    child: IconButton(
                        iconSize: 24.0,
                        icon: Icon(todo.checked
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked),
                        onPressed: () {
                          _setCheckMark(todo);
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          child: Text(
                            '${todo.tag.name}',
                            style: TextStyle(
                              color: HexColor('${todo.tag.color}'),
                              fontSize: 12,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: HexColor('33${todo.tag.color}'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '${todo.task}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        }).toList()),
      ),
    );
  }
}
