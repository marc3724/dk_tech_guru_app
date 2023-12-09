import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TextEditingController myController = TextEditingController();

  void getText() {
    print(myController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("welcome"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.lightBlueAccent,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("title "),
                Text("description "),
                Text("points "),
                Text("weekday "),
                Text("date"),
                //ElevatedButton(onPressed: getText, child: Text("hello")
                //),
              ],
            ),
          ),
          Container(
            color: Colors.lightBlueAccent,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("mytitle "),
                Text("mydescription "),
                Text("mypoints "),
                Text("myweekday "),
                Text("mydate"),
                //ElevatedButton(onPressed: getText, child: Text("hello")
                //),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
