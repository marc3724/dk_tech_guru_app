import 'package:flutter/material.dart';
import 'views/tasks_page.dart';

void main() {
  runApp(const ToDoApp());
}


class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: TaskPage(),
    );
  }
}
