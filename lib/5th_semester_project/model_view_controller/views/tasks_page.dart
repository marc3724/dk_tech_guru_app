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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController pointValueController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();

  ToDoDatabase db = ToDoDatabase();


  @override
  void initState() {
    testStart();
    print("start initState (Taskpage)");
    // if this is the 1st time ever openin the app, then create default data
    if (db.boxIsEmpty() == true) {
      db.createInitialdata();
    } else {
      // there already exists data
      db.loadData();
      print("almost end initState (Taskpage)");

    }
    super.initState();
    print("end initState (Taskpage)");

  }

  //TextEditingController myController = TextEditingController();
  TaskController myTaskController = TaskController();


//todo move to controller and make use of Tasks instead of var
  void saveNewTask(Task task) {
    setState(() {
      db.addTask([
        Task(
            task.taskID,
            task.taskPointValue,
            task.taskName,
            task.taskDescription,
            task.dueDate,
            task.isDone,
            task.doesRepeat),
      ] as Task);
      //_controller.clear();
    });
    Navigator.of(context).pop();
    //db.updateDatabase();
  }

//todo move to controller and make use of Tasks instead of var
  //create a new Task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            onSave: () {

              // Get user input
              String taskName = nameController.text;
              String taskDescription = descriptionController.text;
              int taskPointValue = int.tryParse(pointValueController.text) ?? 0;
              // todo You might want to use a date picker for better user experience
              DateTime dueDate = DateTime.parse(dueDateController.text);

              // Create Task                      db.uniqueID
              Task newTask = Task(3, taskPointValue, taskName, taskDescription, dueDate, false, false); // Default doesRepeat value


              // Save the new task
              saveNewTask(newTask);
              // Close the dialog
              Navigator.of(context).pop();
            },

            //controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void checkBoxChanged(Task task) {
    setState(() {
      task.isDone = !task.isDone;
    });
  }

//todo move to controller and make use of Tasks instead of var
  void deleteTask(int taskIndex) {
    setState(() {
      myTaskController.deleteTask(taskIndex);
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
          //TODO create check for if there is space for the description and then show it depending if there is

          Expanded(
            //TODO write about this in the rapport
            child: ListView.builder(
              itemCount: db.loadData().length,
              itemBuilder: (context, index) {
                Task task = db.loadData()[index];
                return ToDoTile(
                  taskName: task.taskName,
                  taskCompleted: task.isDone,
                  dueDate: task.dueDate,
                  //TODO call method for changing duedate to string and limit it to date only unless its the date then include time
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
