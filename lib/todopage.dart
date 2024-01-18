import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  // tect editing controller to get access to what the user typed
  TextEditingController mycontroller = TextEditingController();

  String greetingMessage = "";
  //greed user method
  void greedUser() {
    String userName = mycontroller.text;
    greetingMessage = "hello,$userName";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //greet user message
              Text(greetingMessage),
              TextField(
                controller: mycontroller,
                decoration: const InputDecoration(
                    hintText: "Any thing you like",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: greedUser, child: const Text("press"))
            ],
          ),
        ),
      ),
    );
  }
}
