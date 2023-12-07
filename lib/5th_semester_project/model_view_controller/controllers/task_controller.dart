import '../models/tasks.dart';

class TaskController {
  List<Task> tasks = []; // En liste til at gemme opgaver

  void createTask(Task task) {
    tasks.add(task);
  }

  void updateTask(int taskId, {
    String? taskName,
    String? taskDescription,
    DateTime? dueDate,
  }) {
    {
      final index = tasks.indexWhere((task) => task.taskID == taskId);

      if (index >= 0) {
        // Use getters and setters to update properties
        if (taskName != null) {
          tasks[index].taskName = taskName;
        }

        if (taskDescription != null) {
          tasks[index].taskDescription = taskDescription;
        }

        if (dueDate != null) {
          tasks[index].dueDate = dueDate;
        }
      }
    }
  }

  void deleteTask(int taskId) {
    tasks.removeWhere((task) => task.taskID == taskId);
  }

  List<Task> getTasks() {
    return tasks;
  }
}