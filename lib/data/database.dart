import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List ToDoList = [];

  // refrence  our box

  final _myBox = Hive.box("myBox");
  // run this method if this is the first time very opening this app
  void createInitialData() {
    ToDoList = [
      [" make Tutoiral", false],
      ["do Exercise", false],
    ];
  }

  // load the data from the database
  void LoadData() {
    ToDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBae() {
    _myBox.put("TODOLIST", ToDoList);
  }
}
