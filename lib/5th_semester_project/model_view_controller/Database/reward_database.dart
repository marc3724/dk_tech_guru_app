import 'package:dk_tech_guru_app/5th_semester_project/model_view_controller/models/rewards.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List<Reward> myRewardList = [];

  final _myBox = Hive.box("myBox");

  void createInitialdata(){
    myRewardList = [
      Reward.defaultConstructor(2, 15, 'Task 2', 'Description 2',false)
    ];
  }

  //load the data from database
  void loadData(){
    myRewardList = _myBox.get("TODOLIST");
  }



  // update the database
  void updateDatabase(){
    _myBox.put("TODOLIST", myRewardList);
  }
}