import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Database/task_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    ToDoDatabase db = ToDoDatabase();
    db.initializeDatabase();

    if (db.boxIsEmpty() == true) {
      db.createInitialData();
    }
    //not used
    else {
      // there already exists data
      db.loadData();
      print("almost end initState (Taskpage)");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Go to TaskPage'),
              onPressed: () {
                Navigator.pushNamed(context, '/taskPage');
              },
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
