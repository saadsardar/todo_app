import 'package:flutter/material.dart';
import 'package:todo_app/Screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      home: HomeScreen(),
    );
  }
}
