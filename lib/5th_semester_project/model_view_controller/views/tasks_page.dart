import 'dart:async';

import 'package:dk_tech_guru_app/5th_semester_project/model_view_controller/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import '../Database/task_database.dart';
import '../controllers/task_controller.dart';
import '../models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/dialog_box.dart';

class TaskPage extends StatefulWidget {
  TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  void testStart() => print("start _taskpage (Taskpage)");

  //final _myBox = Hive.box("myBox");
  /*final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController pointValueController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();*/

  ToDoDatabase db = ToDoDatabase();
  TaskController myTaskController = TaskController();


  @override
  void initState() {

    /*final controller  = StreamController<int>();
    controller.stream.listen((value) {
      print('Tæller opdateret: $value');
      // Opdater brugergrænsefladen her (ikke vist i dette enkle eksempel)
    });
*/
    testStart();
    print("start initState (Taskpage)");
    // if this is the 1st time ever openin the app, then create default data
    if (db.boxIsEmpty() == true) {
      db.createInitialData();
    }
    //not used
    else {
      // there already exists data
      db.loadData();
      print("almost end initState (Taskpage)");

    }
    super.initState();
    print("end initState (Taskpage)");

  }

  //TextEditingController myController = TextEditingController();


//todo move to controller and make use of Tasks instead of var
  void saveNewTask(Task task) {
    setState(() {
      db.addTask(task);
      /*db.addTask([
        Task(
            task.taskID,
            task.taskPointValue,
            task.taskName,
            task.taskDescription,
            task.dueDate,
            task.isDone,
            task.doesRepeat),
      ] as Task);*/
      //_controller.clear();
    });
    Navigator.of(context).pop();
    //db.updateDatabase();
  }

  // Define a function to handle data from DialogBox
  void handleDataFromDialog(
      String name,
      String description,
      int pointValue,
      DateTime dueDate) {
    // Do something with the data, e.g., create a new task
    print("name = $name Datetime = $dueDate");
    Task newTask = Task(3, pointValue, name, description, dueDate, false, false);
    saveNewTask(newTask);
  }


//todo move to controller and make use of Tasks instead of var
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            onSave: handleDataFromDialog,
            /*{
              // Get user input
              String taskName = nameController.text;
              print(taskName);
              print(nameController.text);

              String taskDescription = descriptionController.text;
              int taskPointValue = int.tryParse(pointValueController.text) ?? 0;
              // todo You might want to use a date picker for better user experience
              print("date");
              if(dueDateController.text.length < 1){
                print("empty");
              }
              else {
                print("date = ${dueDateController.text}");
              }
              DateTime dueDate = DateTime.parse(dueDateController.text);


              // Create Task    db.uniqueID
              Task newTask = Task(3, taskPointValue, taskName, taskDescription, dueDate, false, false); // Default doesRepeat value

              saveNewTask(newTask);
              Navigator.of(context).pop();
            },*/
            onCancel: () => Navigator.of(context).pop(),
            dialogContext: context,
          );
        });
  }

  void checkBoxChanged(Task task) {
    setState(() {
      myTaskController.toggleTaskDoneStatus(task);
      //task.isDone = !task.isDone;
    });
  }

//todo move to controller and make use of Tasks instead of var
  void deleteTask(int taskIndex) {
    setState(() {
      db.deleteTask(taskIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ToDo App"),
        backgroundColor: Colors.lightGreenAccent,
      ),

      //TODO implement missing function "createNewTask" make sure everything works
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

      //body
      body: Column(
        children: [
          //
          Container(

            color: Colors.lightBlueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Title"),
                Text("Description"),
                Text("Points"),
                //Text("Weekday"),
                Text("Date"),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: db.loadData().length,
              itemBuilder: (context, index) {
                Task task = db.loadData()[index];
                return ToDoTile(
                  taskName: task.taskName,
                  taskCompleted: task.isDone,

                  //TODO make a method for changing duedate to string and limit it to the date only
                  //TODO make a check to the method above and if the date are the same as "today" use time
                  dueDate: task.dueDate,

                  //TODO make a method that checks if there is space for the description.
                  taskDescription: task.taskDescription,

                  taskPointValue: task.taskPointValue,
                  onChanged: (value) => checkBoxChanged(task),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
