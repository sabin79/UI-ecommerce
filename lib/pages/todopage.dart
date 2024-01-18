import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uibasic/data/database.dart';
import 'package:uibasic/utils/dialogbox.dart';

import '../utils/todolist.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  // tect editing controller to get access to what the user typed
  // TextEditingController mycontroller = TextEditingController();

  // String greetingMessage = "";
  // //greed user method
  // void greedUser() {
  //   String userName = mycontroller.text;
  //   greetingMessage = "hello,$userName";
  // }

// refrence the hive box
  final _myBox = Hive.box("mybox");
  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() {
    // if this is the 1st time ever opening this app , then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.LoadData();
    }
    super.initState();
  }

// list of todo task
  // List todoList = [
  //   ["make tutorial", false],
  //   ["do tutorial", false]
  // ];

// text controller
  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.ToDoList[index][1] = !db.ToDoList[index][1];
    });
    db.updateDataBae();
  }

  // ssave new task
  void saveNewTask() {
    setState(() {
      db.ToDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBae();
  }

  // create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controler: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.pop(context),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.ToDoList.removeAt(index);
      db.updateDataBae();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Center(child: Text("To Do List")),
        elevation: 0.0,
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      //    body: _textfield(),
      body: ListView.builder(
          itemCount: db.ToDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.ToDoList[index][0],
              taskCompleted: db.ToDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }

  // Center _textfield() {
  //   return Center(
  //     child: Padding(
  //       padding: const EdgeInsets.all(20.0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           //greet user message
  //           Text(greetingMessage),
  //           TextField(
  //             controller: mycontroller,
  //             decoration: const InputDecoration(
  //                 hintText: "Any thing you like",
  //                 border: OutlineInputBorder()),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           ElevatedButton(onPressed: greedUser, child: const Text("press"))
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
