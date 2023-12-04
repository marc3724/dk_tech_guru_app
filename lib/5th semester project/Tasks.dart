

class Task {
 //remove ?
  int? taskID, taskPointValue;
  String? taskName, taskDescription;
  DateTime? dueDate;
  bool? isDone, doesRepeat;


  Task.myTask(
      this.taskID,
      this.taskPointValue,
      this.taskName,
      this.taskDescription,
      this.dueDate,
      this.isDone,
      this.doesRepeat,
      );

  Task.test(
      this.taskID,
      this.taskName,
      this.taskDescription,
      this.taskPointValue,
      this.dueDate,
      );

static DateTime setDueDate() {
   DateTime dueDate = DateTime(2023, 11, 30, 23);
   return dueDate;
   }


}
