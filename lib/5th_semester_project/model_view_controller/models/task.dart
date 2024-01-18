import 'package:hive/hive.dart';
part 'task.g.dart'; // Generated file

@HiveType(typeId: 2)
class Task {

  @HiveField(0)
  int _taskID;

  @HiveField(1)
  int _taskPointValue;

  @HiveField(2)
  String _taskName;

  @HiveField(3)
  String _taskDescription;

  @HiveField(4)
  DateTime _dueDate;

  @HiveField(5)
  bool _isDone;

  @HiveField(6)
  bool _doesRepeat;

  Task(this._taskID,
      this._taskPointValue,
      this._taskName,
      this._taskDescription,
      this._dueDate,
      this._isDone,
      this._doesRepeat);

  int get taskID => _taskID;
  set taskID(int value) {
    _taskID = value;
  }
  bool get doesRepeat => _doesRepeat;
  set doesRepeat(bool value) {
    _doesRepeat = value;
  }

  bool get isDone => _isDone;
  set isDone(bool value) {
    _isDone = value;
  }

  DateTime get dueDate => _dueDate;
  set dueDate(DateTime value) {
    _dueDate = value;
  }

  String get taskDescription => _taskDescription;
  set taskDescription(String value) {
    _taskDescription = value;
  }

  String get taskName => _taskName;
  set taskName(String value) {
    _taskName = value;
  }

  int get taskPointValue => _taskPointValue;
  set taskPointValue(int value) {
    _taskPointValue = value;
  }
}
class task2 {

  String? taskName, taskDescription, dueDate, isDone, doesRepeat;
  int? taskID, taskPointValue;

  // Contructors
  void addTask(int taskID, taskPointValue, String taskName, taskDescription, dueDate, isDone, doesRepeat){
    this.taskID = taskID;
    this.taskPointValue = taskPointValue;
    this.taskName = taskName;
    this.taskDescription = taskDescription;
    this.dueDate = dueDate;
    this.isDone = isDone;
    this.doesRepeat = doesRepeat;
  }

  // Show the task
  void showTask(){
    print('taskPointValue = $taskPointValue');
    print('taskName = $taskName');
    print('taskDescription = $taskDescription');
    print('dueDate = $dueDate');
    print('isDone = $isDone');
    print('doesRepeat = $doesRepeat');
  }

}