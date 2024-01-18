import 'package:dk_tech_guru_app/5th_semester_project/model_view_controller/controllers/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'my_button.dart';

//Warning:(6, 7) This class (or a class that this class inherits from) is marked as '@immutable', but one or more of its instance fields aren't final: DialogBox.onSave, DialogBox.onCancel
class DialogBox extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController pointValueController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();


  //VoidCallback onSave;
  Function(String, String, int, DateTime)? onSave;
  VoidCallback onCancel;
  final BuildContext dialogContext;

  DialogBox({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.dialogContext,
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
                  labelText: "Date",
                  prefixIcon: Icon(Icons.calendar_today),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                  )),
              readOnly: true,
              onTap: () =>_selectDate(),
            ),

            //TODO fix the layout on this
            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                TextButton(
                  onPressed: () {
                    // Convert dueDateController.text to DateTime
                    DateTime? dueDate =
                    DateTime.tryParse(dueDateController.text);
                    onSave?.call(
                      nameController.text,
                      descriptionController.text,
                      int.tryParse(pointValueController.text) ?? 0,
                      dueDate ?? DateTime.now(),
                    );
                  },
                  //color: Theme.of(context).primaryColor,
                  child: Text("Save"),
                ),
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

  //-----------Functions------------------------------------------------------------
  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: dialogContext,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2124)
    );

    if(_picked != null){
      //why use " " 2024-01-16 03:03:53.629012 space between date and time
      dueDateController.text = DateFormat('yyyy-MM-dd').format(_picked);
      //dueDateController.text = _picked.toString().split(" ")[0];
      print(dueDateController.text);
    }
  }

}
