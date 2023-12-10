import 'package:flutter/material.dart';
import '../controllers/task_controller.dart';
import '../models/tasks.dart';

class TaskPage extends StatefulWidget {
  TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TextEditingController myController = TextEditingController();


  /*@override
  void initState() {
    super.initState();
    taskController = TaskController(); // Initialize the TaskController instance
    myTaskList = taskController.getTasks(); // Call the method on the instance

  }*/

  void getText() {
    print(myController.text);
  }

  void getTasks(List<Task> taskList){
    List<Task> myTaskList = taskList;
  }
  //a list for saving Tasks

  //List<Task> taskList = TaskController.getTasks().cast<Task>();

  /*void generateTaskFromList(List<Task> list){
    for (int i = 0; i < list.length; i++) {



    }
  }*/


  @override
  Widget build(BuildContext context) {
    TaskController myTaskController = TaskController();
    myTaskController.createTask(1, 10, 'Task 1', 'Description 1', DateTime.now(), false, true);

    //Task task2 = Task.defaultConstructor(2, 15, 'Task 2', 'Description 2', DateTime.now(), false, true);
    myTaskController.createTask(2, 15, 'Task 2', 'Description 2', DateTime.now(), false, true);
    List myTaskList = myTaskController.getTasks();
    
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo App"),
        backgroundColor: Colors.lightGreenAccent,
      ),
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
          //TODO write about this in the rapport
          Expanded(
            child: ListView.builder(
              itemCount: myTaskList.length,
              itemBuilder: (context, index) {
                Task task = myTaskList[index];
                return Container(
                  color: Colors.lightBlueAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(task.taskName),
                      Text(task.taskDescription),
                      Text(task.taskPointValue.toString()),
                      Text(task.dueDate.toString()),

                      // Add more Text widgets based on task properties
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}