/*
import 'package:dk_tech_guru_app/5th_semester_project/model_view_controller/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import '../Database/reward_database.dart';
import '../controllers/reward_controller.dart';
import '../models/rewards.dart';
import 'package:hive_flutter/hive_flutter.dart';


class RewardPage extends StatefulWidget {
  RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPageState();
}
// look into ??????????????????????????????????????????????????????????????????????????????????????????????????
class _RewardPageState extends State<RewardPage> {
  final _myBox = Hive.box("myBox");
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialdata();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();



  //TextEditingController myController = TextEditingController();
  RewardController myRewardController = RewardController();


//todo implement this in createNewReward
  void saveNewReward(Reward reward){
    setState(() {
      db.myRewardList.add([Reward.defaultConstructor(
          reward.rewardID,
          reward.rewardPointValue,
          reward.rewardName,
          reward.rewardDescription,
          reward.isBought
      ),
      ] as Reward);
      //_controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }


  void checkBoxChanged(Reward reward) {
    setState(() {
      reward.isBought = !reward.isBought;
    });
  }

  void deleteReward(Reward reward) {
    setState(() {
      myRewardController.deleteReward(reward.rewardID);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("here we build rewardpage");


    //Task task2 = Task.defaultConstructor(2, 15, 'Task 2', 'Description 2', DateTime.now(), false, true);


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ToDo App"),
        backgroundColor: Colors.lightGreenAccent,
      ),


      //body
      body: Column(
        children: [
          //
          Container(

            color: Colors.lightBlueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Title"),
                Text("Description"),
                Text("Points"),
              ],
            ),
          ),
          //TODO create check for if there is space for the description and then show it depending if there is

          */
/*Expanded(
            //TODO write about this in the rapport
            child: ListView.builder(
              itemCount: db.myRewardList.length,
              itemBuilder: (context, index) {
                Reward reward = db.myRewardList[index];
                return ToDoTile(
                  rewardName: reward.rewardName,
                  rewardCompleted: reward.isBought,
                  rewardDescription: reward.rewardDescription,
                  rewardPointValue: reward.rewardPointValue,
                  onChanged: (value) => checkBoxChanged(reward),
                  deleteFunction: (context) => deleteReward(reward),
                );
              },
            ),
          ),*//*

        ],
      ),
    );
  }
}
*/
