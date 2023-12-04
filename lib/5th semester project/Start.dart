import 'package:dk_tech_guru_app/5th%20semester%20project/Tasks.dart';

void main(){

  Task myTask = Task.test(1, "TestTask");
  Task my2ndTask = Task.test(2, "TestTask");
  List<Task> myList = [myTask,my2ndTask];

  print(myList[0]);

  Task currentTask = myList[1];
  print(currentTask.taskID);
}