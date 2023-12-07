import 'controllers/group_controller.dart';
import 'models/group_members.dart';
import 'models/tasks.dart';
import 'models/group.dart';
import 'controllers/task_controller.dart';

void main() {
  TaskController taskController = TaskController();

  Task task1 = Task.defaultConstructor(1, 10, 'Task 1', 'Description 1', DateTime.now(), false, true);
  taskController.createTask(task1);

  Task task2 = Task.defaultConstructor(2, 15, 'Task 2', 'Description 2', DateTime.now(), false, true);
  taskController.createTask(task2);

  Task task3 = Task.test(3, "Task 3 fuckers",taskDescription: "hello");
  // Hent og udskriv alle opgaver
  print(taskController.getTasks());

  // Opdater en opgave
  task3.taskName = 'Updated Task 3';
  taskController.updateTask(2,taskDescription: "hello bitches");

  // Hent og udskriv alle opgaver igen
  print(taskController.getTasks());

  // Slet en opgave
  taskController.deleteTask(1);

  // Hent og udskriv alle opgaver efter sletning
  print(taskController.getTasks());



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