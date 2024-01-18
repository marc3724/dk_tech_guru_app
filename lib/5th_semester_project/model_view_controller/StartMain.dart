import 'dart:io';

import 'package:dk_tech_guru_app/5th_semester_project/model_view_controller/views/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../firebase_options.dart';
import 'Database/task_database.dart';
import 'models/boxes.dart';
import 'models/task.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  /*var variable1;
  print(variable1);*/

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  await Hive.initFlutter();
  ToDoDatabase db = ToDoDatabase();
  db.initializeDatabase();
  Hive.registerAdapter(TaskAdapter());


  boxTasks = await Hive.openBox<Task>("myBox");
  Task test = Task(2, 10, 'Task 2', 'please work 2', DateTime.now(), false, true);

  //boxTasks.clear();
  print(db.boxIsEmpty());
  if(db.boxIsEmpty() == false){
    Task? myTask = boxTasks.getAt(0);
    //boxTasks.put(2, test);
    print("my box values are ${myTask?.taskName}}");
    print("Let's get started");
  }
  else {
    print("else was used");
    db.createInitialData();
  }

  //db.addTask(Task(1, 15, 'swipe left 2 delete', 'Description 2', DateTime.now(), false, false));
  print("Let's get started again");
  print("is box empty ${db.boxIsEmpty()}");



  runApp(const ToDoApp());
}


class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("here we build ToDoApp");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskPage(),
    );
  }
}
