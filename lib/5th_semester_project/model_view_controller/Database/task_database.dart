import 'package:dk_tech_guru_app/5th_semester_project/model_view_controller/models/boxes.dart';
import 'package:dk_tech_guru_app/5th_semester_project/model_view_controller/models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  //late Box<Task> boxTasks;

  Future<void> initializeDatabase() async {
    if (Hive.isBoxOpen('myBox') == false) {
      print("box has been opened");
      boxTasks = await Hive.openBox<Task>('myBox');
    } else {
      print("box was already open");
      boxTasks = Hive.box<Task>('myBox');
    }
  }

  //run only, the 1st time the app is launched.

  Future <void> createInitialdata() async {
    addTask(Task(1, 15, 'swipe left 2 delete',
        'Description 2', DateTime.now(), false, false));

    addTask(Task(2, 10, 'hold down to edit', 'Description 2',
        DateTime.now(), false, false));

    addTask(Task(3, 100, 'title for task 3', 'Description 2',
        DateTime.now(), false, false));

    addTask(Task(4, 8, 'im so fucking tired', 'Description 2',
        DateTime.now(), false, false));

    addTask(Task(5, 5, 'lets start ww3 please UwU', 'Description 2',
        DateTime.now(), false, false));
  }


  List<Task> loadData() {
    return boxTasks.values.toList();
  }


 /* Future<void> updateDatabase() async {
    await boxTasks.clear();
    await boxTasks.addAll(loadData());
  }*/

  boxIsEmpty() => boxTasks.isEmpty;

  Future<void> addTask(Task task) async {
    print("added task with the name ${task.taskName}");
    await boxTasks.add(task);
  }

  Future<void> deleteTask(int taskIndex) async {
    print("deleted $taskIndex");
    await boxTasks.deleteAt(taskIndex);
  }

/*
  List<Task> getAllTasks() {
    return _taskBox.values.toList();
  }

  //load the data from database
  void loadData() {
    myTaskList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDatabase() {
    _myBox.put("TODOLIST", myTaskList);
  }*/
}

/*import 'package:dk_tech_guru_app/5th_semester_project/model_view_controller/models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  late Box<Task> _taskBox;

  Future<void> initializeDatabase() async {
    _taskBox = await Hive.openBox<Task>('myBox');
  }

  Future<void> createInitialdata() async {
    await _taskBox.clear();
    List<Task> myTaskList = [
      Task.defaultConstructor(1, 15, 'swipe left 2 delete', 'Description 2', DateTime.now(), false, false),
      Task.defaultConstructor(2, 15, 'hold down to edit', 'Description 2', DateTime.now(), false, false),
    ];
    await _taskBox.addAll(myTaskList);
  }

  List<Task> loadData() {
    return _taskBox.values.toList();
  }

  Future<void> updateDatabase() async {
    await _taskBox.clear();
    await _taskBox.addAll(loadData());
  }

  Future<void> addTask(Task task) async {
    await _taskBox.add(task);
  }

  Future<void> updateTask(int taskId, {String? taskName, String? taskDescription, DateTime? dueDate}) async {
    final index = _taskBox.keys.cast<int>().toList().indexOf(taskId);
    if (index >= 0) {
      final updatedTask = _taskBox.getAt(index);
      if (updatedTask != null) {
        if (taskName != null) updatedTask.taskName = taskName;
        if (taskDescription != null) updatedTask.taskDescription = taskDescription;
        if (dueDate != null) updatedTask.dueDate = dueDate;
        await _taskBox.putAt(index, updatedTask);
      }
    }
  }

  Future<void> toggleTaskDoneStatus(int taskId) async {
    final index = _taskBox.keys.cast<int>().toList().indexOf(taskId);
    if (index >= 0) {
      final updatedTask = _taskBox.getAt(index);
      if (updatedTask != null) {
        updatedTask.isDone = !updatedTask.isDone;
        await _taskBox.putAt(index, updatedTask);
      }
    }
  }


}
*/
