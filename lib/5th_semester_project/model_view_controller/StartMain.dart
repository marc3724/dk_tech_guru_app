import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'views/tasks_page.dart';

void main() async{

  await Hive.initFlutter();
  var box = await Hive.openBox("myBox");
  runApp(const ToDoApp());
}


class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("here we build ToDoApp and we will keep building it again and again");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: TaskPage(),
    );
  }
}
