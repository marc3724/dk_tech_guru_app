import 'package:intl/intl.dart';

import 'controllers/group_controller.dart';
import 'models/group_members.dart';
import 'models/tasks.dart';
import 'models/group.dart';
import 'controllers/task_controller.dart';

void main() {
  TaskController myTaskController = TaskController();

  //Task task1 = Task.defaultConstructor(1, 10, 'Task 1', 'Description 1', DateTime.now(), false, true);
  myTaskController.createTask(1, 10, 'Task 1', 'Description 1', DateTime.now(), false, true);

  //Task task2 = Task.defaultConstructor(2, 15, 'Task 2', 'Description 2', DateTime.now(), false, true);
  myTaskController.createTask(2, 15, 'Task 2', 'Description 2', DateTime.now(), false, true);

  //Task task3 = Task.test(3, "Task 3 fuckers",taskDescription: "hello");
  //myTaskController.createTask(task3);

  // Hent og udskriv alle opgaver
  print(myTaskController.getTasks());

  // Opdater en opgave
  myTaskController.updateTask(3,taskDescription: "new and updated description");
  myTaskController.updateTask(2,taskDescription: "hello bitches");

  // Hent og udskriv alle opgaver igen
  List<Task> tasks = myTaskController.getTasks();
  String formattedDate = DateFormat('yyyy-MM-dd').format(tasks[1].dueDate);
  print('Formatted Date: $formattedDate');
  String formattedDateTime  = DateFormat('yyyy-MM-dd HH:mm').format(tasks[1].dueDate);
  print('Formatted Date: $formattedDateTime');
  print(tasks[1].dueDate);

  // Slet en opgave
  //myTaskController.deleteTask(1);


  // Hent og udskriv alle opgaver efter sletning
  print(myTaskController.getTasks());

  List<Task> myList = myTaskController.getTasks();
  print("length of mylist = ${myList.length}");
  for (int i = 0; i < myList.length; i++) {
    print("this is task nr ${myList[i].taskID.toString()}" );

    // Your code here
  }

  Group_Members user1 = Group_Members(membersId: 1, membersname: 'User1');
  Group_Members user2 = Group_Members(membersId: 2, membersname: 'User2');

  group group1 = group(groupId: 1, groupName: 'group A');
  group group2 = group(groupId: 2, groupName: 'group b');

  GroupController groupController = GroupController();

  // Add users to groups
  groupController.addUserToGroup(user1, group1);
  groupController.addUserToGroup(user2, group1);
  groupController.addUserToGroup(user2, group2);

  // Remove a user from a group
  groupController.removeUserFromGroup(user1, group1);

  // Print group information

  print('GroupA Members: ${group1.members.map((user) => user.membersname)}');
  print('GroupB Members: ${group2.members.map((user) => user.membersname)}');



}