import 'package:dk_tech_guru_app/5th%20semester%20project/Tasks.dart';

void main(){

  Task myTask = Task.test(1, "TestTask","dick move",12);
  Task my2ndTask = Task.test(2, "TestTask","dsf",12);
  List<Task> myList = [myTask,my2ndTask];

  Task 

  print(myList[0]);

  Task currentTask = myList[1];
  print(currentTask.taskID);
}