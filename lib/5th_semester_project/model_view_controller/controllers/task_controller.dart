import '../Database/task_database.dart';
import '../models/task.dart';

class TaskController {
  final ToDoDatabase _database = ToDoDatabase();

  //List<Task> listOfTasks = []; // En liste til at gemme opgaver

  /*TODO skriv om det i rapporten (old code)
  void createTask(Task task) {
    listOfTasks.add(task);
    task would be created in another class

    Task task1 = Task.defaultConstructor(1, 10, 'Task 1', 'Description 1', DateTime.now(), false, true);
  myTaskController.createTask(task1);
  and sent over
  }
  */


  /*void createTask(
      int taskID,
      int taskPointValue,
      String taskName,
      String taskDescription,
      DateTime dueDate,
      bool isDone,
      bool doesRepeat
      ) {
    Task task = Task(
        taskID,
        taskPointValue,
        taskName,
        taskDescription,
        dueDate,
        isDone,
        doesRepeat);
    _database.addTask(task);
  }*/
  Task createTask(
      int taskID,
      int taskPointValue,
      String taskName,
      String taskDescription,
      DateTime dueDate,
      bool isDone,
      bool doesRepeat
      )  {
    return Task (
        taskID,
        taskPointValue,
        taskName,
        taskDescription,
        dueDate,
        isDone,
        doesRepeat);
  }

  //fix {}
  void updateTask(Task task,
      {
    String? taskName,
    String? taskDescription,
    int? pointValue,
    DateTime? dueDate,
  }) {
    {
      // Use getters and setters to update properties
      if (taskName != null) {
        task.taskName = taskName;
      }

      if (taskDescription != null) {
        task.taskDescription = taskDescription;
      }

      if (pointValue != null) {
        task.taskPointValue = pointValue;
      }

      if (dueDate != null) {
        task.dueDate = dueDate;
      }
    }
  }

  void toggleTaskDoneStatus(Task task) {
    print(task.taskName);
    task.isDone = !task.isDone;
  }

  void deleteTask(int taskIndex) => _database.deleteTask(taskIndex);

  //no longer in use
  List<Task> getTasks() => _database.loadData();
}
  /* normal way of writing it
  List<Task> getTasks() {
    return _database.loadData();
  }
*/


/*import '../Database/task_database.dart';
import '../models/task.dart';


TODO fix this so the controller handles changes such as update happens here but the changes is sent to both the view and database


class TaskController {
  ToDoDatabase _database;

  TaskController(this._database);

  void createTask(int taskID, int taskPointValue, String taskName, String taskDescription, DateTime dueDate, bool isDone, bool doesRepeat) {
    Task task = Task.defaultConstructor(taskID, taskPointValue, taskName, taskDescription, dueDate, isDone, doesRepeat);
    _database.addTask(task);
  }

  void updateTask(int taskId, {String? taskName, String? taskDescription, DateTime? dueDate}) {
    _database.updateTask(taskId, taskName: taskName, taskDescription: taskDescription, dueDate: dueDate);
  }

  void toggleTaskDoneStatus(Task task) {
    _database.toggleTaskDoneStatus(task.taskID);
  }

  void deleteTask(int taskId) {
    _database.deleteTask(taskId);
  }

  List<Task> getTasks() {
    return _database.getAllTasks();
  }
}
*/
  /*Task generateRandomTask() {
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
  }*/
