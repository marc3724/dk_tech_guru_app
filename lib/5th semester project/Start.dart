import 'package:dk_tech_guru_app/5th%20semester%20project/Business/Entities/Tasks.dart';

void main(){

  //Task myTask = Task.test(1,"fuck");
  Task my2ndTask = Task.defaultConstructor(1, 999, "f soceity", "gong to hell", DateTime(2224,12,5,12,0), false, true);
  int id = my2ndTask.taskID;
  print(id);
  int id2 = 5;
  my2ndTask.taskID = id2;
  print(my2ndTask.taskID);

  Task task1 = Task.defaultConstructor(1, 10, 'Task 1', 'Description 1', DateTime.now(), false, true);
  List<Task> myTaskList = [task1,my2ndTask];

  Task fuckThisTask  = Task.test(666, "fuckYeah");
  print(fuckThisTask.dueDate);
  fuckThisTask.dueDate=DateTime(2023,12,5);
  print(fuckThisTask.dueDate);

  myTaskList.add(fuckThisTask);
  myTaskList.removeAt(1);
    // task2 has custom values for taskPointValue and doesRepeat, the rest will use default values

 /* List<Task> myList = [myTask,my2ndTask];


  print(myList[0]);

  Task currentTask = myList[1];
  print(currentTask.taskID);*/
}