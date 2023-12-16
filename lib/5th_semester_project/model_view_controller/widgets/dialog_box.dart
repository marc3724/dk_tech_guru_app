import 'package:dk_tech_guru_app/5th_semester_project/model_view_controller/controllers/task_controller.dart';
import 'package:flutter/material.dart';

import 'my_button.dart';
//Warning:(6, 7) This class (or a class that this class inherits from) is marked as '@immutable', but one or more of its instance fields aren't final: DialogBox.onSave, DialogBox.onCancel
class DialogBox extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController pointValueController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "give your task a name",
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "give your task a description",
              ),
            ),
            TextField(
              controller: pointValueController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "give your task a point value",
              ),
            ),
            TextField(
              controller: dueDateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "give your task a due date",
              ),
            ),

            //TODO fix the layout on this
            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(width: 8),

                // cancel button
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
