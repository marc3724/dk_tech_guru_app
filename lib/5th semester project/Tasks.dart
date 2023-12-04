class Task {
  int _taskID, _taskPointValue;
  String _taskName, _taskDescription;
  DateTime _dueDate;
  bool _isDone, _doesRepeat;

  Task.defaultConstructor(
      this._taskID,
      this._taskPointValue,
      this._taskName,
      this._taskDescription,
      this._dueDate,
      this._isDone,
      this._doesRepeat
      );


  Task.test(
      this._taskID,
      this._taskName, {
        int taskPointValue = 0,
        String taskDescription = '',
        DateTime? dueDate,
        bool isDone = false,
        bool doesRepeat = false,
      })  : _taskPointValue = taskPointValue,
        _taskDescription = taskDescription,
        _dueDate = dueDate ?? DateTime.now(),
        _isDone = isDone,
        _doesRepeat = doesRepeat;


  bool get doesRepeat => _doesRepeat;
  set doesRepeat(value) {
    _doesRepeat = value;
  }


  bool get isDone => _isDone;
  set isDone( value) {
    _isDone = value;
  }


  DateTime get dueDate => _dueDate;
  set dueDate( value) {
    _dueDate = value;
  }


  String get taskDescription => _taskDescription;
  set taskDescription(value) {
    _taskDescription = value;
  }


  String get taskName => _taskName;
  set taskName( value) {
    _taskName = value;
  }


  int get taskPointValue => _taskPointValue;
  set taskPointValue( value) {
    _taskPointValue = value;
  }


  int get taskID => _taskID;
  set taskID( value) {
    _taskID = value;
  }

/*Task.testName(
     this.taskID,
     this.taskName,
  );*/

}

/*static DateTime setDueDate() {
   DateTime dueDate = DateTime(2023, 11, 30, 23);
   return dueDate;
   }*/