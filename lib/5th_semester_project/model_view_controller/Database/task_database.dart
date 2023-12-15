import 'package:dk_tech_guru_app/5th_semester_project/model_view_controller/models/tasks.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List<Task> myTaskList = [];

  final _myBox = Hive.box("myBox");


  //run only, the 1st time the app is launched.
  void createInitialdata(){
    myTaskList = [
    Task.defaultConstructor(2, 15, 'Task 2', 'Description 2', DateTime.now(),false ,false)
    ];
  }

  //load the data from database
  void loadData(){
    myTaskList = _myBox.get("TODOLIST");
  }



  // update the database
  void updateDatabase(){
    _myBox.put("TODOLIST", myTaskList);
  }
}