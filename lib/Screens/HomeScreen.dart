import 'package:flutter/material.dart';
import 'package:todo_app/Models/Task.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Todo> taskList = [];
  int id = 0;
  final myController = TextEditingController();
  void addTaskToList() {
    if (myController.text.isNotEmpty) {
      id++;
      taskList.add(Todo(id, myController.text));
      myController.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: size.width * 0.75,
                  height: size.height * 0.10,
                  child: TextField(
                    controller: myController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Add a task'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: IconButton(
                    onPressed: addTaskToList,
                    icon: Icon(
                      Icons.add,
                      color: Colors.green,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.black)),
                      child: ListTile(
                        title: Text(taskList[index].task),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
