import 'dart:math';

import '../models/tasks.dart';

class TaskController {
  List<Task> listOfTasks = []; // En liste til at gemme opgaver

  /*TODO skriv om det i rapporten (old code)
  void createTask(Task task) {
    listOfTasks.add(task);
    task would be created in another class

    Task task1 = Task.defaultConstructor(1, 10, 'Task 1', 'Description 1', DateTime.now(), false, true);
  myTaskController.createTask(task1);
  and sent over
  }
  */
  void createTask(int taskID, int taskPointValue, String taskName, String taskDescription, DateTime dueDate, bool isDone, bool doesRepeat) {
    Task task = Task.defaultConstructor(taskID, taskPointValue, taskName, taskDescription, dueDate, isDone, doesRepeat);
    listOfTasks.add(task);
  }

  void updateTask(int taskId, {
    String? taskName,
    String? taskDescription,
    DateTime? dueDate,
  }) {
    {
      final index = listOfTasks.indexWhere((task) => task.taskID == taskId);

      if (index >= 0) {
        // Use getters and setters to update properties
        if (taskName != null) {
          listOfTasks[index].taskName = taskName;
        }

        if (taskDescription != null) {
          listOfTasks[index].taskDescription = taskDescription;
        }

        if (dueDate != null) {
          listOfTasks[index].dueDate = dueDate;
        }
      }
    }
  }

  void deleteTask(int taskId) {
    listOfTasks.removeWhere((task) => task.taskID == taskId);
  }

  List<Task> getTasks() {
    return listOfTasks;
  }


  Task generateRandomTask() {
    Random random = Random();

    int taskId = random.nextInt(1000); // Random task ID
    int taskPointValue = random.nextInt(10); // Random point value (0 to 9)
    String taskName = "Task $taskId"; // You can customize this
    String taskDescription = "Random task description"; // You can customize this
    DateTime dueDate = DateTime.now().add(Duration(days: random.nextInt(7))); // Random due date within the next 7 days
    bool isDone = random.nextBool(); // Random completion status
    bool doesRepeat = random.nextBool(); // Random repetition status

    Task randomTask = Task.defaultConstructor(
      taskId,
      taskPointValue,
      taskName,
      taskDescription,
      dueDate,
      isDone,
      doesRepeat,
    );

    return randomTask;
  }
}