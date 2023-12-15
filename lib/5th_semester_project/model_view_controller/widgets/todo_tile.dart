import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

//Warning:(4, 7) This class (or a class that this class inherits from) is marked as '@immutable', but one or more of its instance fields aren't final: ToDoTile.onChanged, ToDoTile.deleteFunction
class ToDoTile extends StatelessWidget {
  final String taskName;
  final String taskDescription;
  final DateTime dueDate; //TODO make string
  final int taskPointValue;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext) deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.dueDate,
    required this.taskDescription,
    required this.taskPointValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      //screen
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),

      //individual task
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          //task decoration
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),

          //start
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              //task name
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),

              Text(
                taskDescription,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),

              Text(
                taskPointValue.toString(),
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),

              /*Text(
                dueDate.toString(),
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
