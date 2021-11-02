import 'package:flutter/material.dart';
import 'package:todo_app/Models/Todo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Todo> taskList = [];
  int id = 0;
  late final TextEditingController todoTextController;
  @override
  void initState() {
    super.initState();
    todoTextController = TextEditingController();
  }

  @override
  void dispose() {
    todoTextController.dispose();
    super.dispose();
  }

  void addTaskToList() {
    // if (todoTextController.text.isNotEmpty) {
    id++;
    taskList.add(Todo(id: id, task: todoTextController.text));
    todoTextController.clear();
    setState(() {});
    // }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('TODO App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.75,
                  height: 50,
                  child: TextFormField(
                    controller: todoTextController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Add a task'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: IconButton(
                    onPressed:
                        todoTextController.text.isEmpty ? null : addTaskToList,
                    icon: Icon(
                      Icons.add,
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
