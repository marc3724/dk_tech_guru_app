import 'package:dk_tech_guru_app/5th_semester_project/model_view_controller/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import '../Database/task_database.dart';
import '../controllers/task_controller.dart';
import '../models/tasks.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/dialog_box.dart';

class TaskPage extends StatefulWidget {
  TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _myBox = Hive.box("myBox");
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController pointValueController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();

  ToDoDatabase db = ToDoDatabase();


  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialdata();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  //TextEditingController myController = TextEditingController();
  TaskController myTaskController = TaskController();

  /*@override
  void initState() {
    super.initState();
    taskController = TaskController(); // Initialize the TaskController instance
    myTaskList = taskController.getTasks(); // Call the method on the instance

  }
  void getText() {
    print("build taskpage");
    print(myController.text);
  }

  void getTasks(List<Task> taskList) {
    List<Task> myTaskList = TaskController().getTasks();
  }

  //a list for saving Tasks
  //List<Task> taskList = TaskController.getTasks().cast<Task>();
  // void generateTaskFromList(List<Task> list){
    for (int i = 0; i < list.length; i++) {

    }
  }*/
//todo move to controller and make use of Tasks instead of var
  void saveNewTask(Task task) {
    setState(() {
      db.myTaskList.add([
        Task.defaultConstructor(
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
    db.updateDatabase();
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
              String taskName = _controller.text;
              String taskDescription = descriptionController.text;
              int taskPointValue = int.tryParse(pointValueController.text) ?? 0;
              // todo You might want to use a date picker for better user experience
              DateTime dueDate = DateTime.parse(dueDateController.text);

              // Create Task
              Task newTask = Task.defaultConstructor(3, taskPointValue, taskName, taskDescription, dueDate, false, false); // Default doesRepeat value


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
  void deleteTask(Task task) {
    setState(() {
      myTaskController.deleteTask(task.taskID);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
        "here we build taskpage and we will keep building it again and again");

    //Task task2 = Task.defaultConstructor(2, 15, 'Task 2', 'Description 2', DateTime.now(), false, true);

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
              itemCount: db.myTaskList.length,
              itemBuilder: (context, index) {
                Task task = db.myTaskList[index];
                return ToDoTile(
                  taskName: task.taskName,
                  taskCompleted: task.isDone,
                  dueDate: task.dueDate,
                  //TODO call method for changing duedate to string and limit it to date only unless its the date then include time
                  taskDescription: task.taskDescription,
                  taskPointValue: task.taskPointValue,
                  onChanged: (value) => checkBoxChanged(task),
                  deleteFunction: (context) => deleteTask(task),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
