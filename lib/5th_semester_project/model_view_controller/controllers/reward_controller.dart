import 'dart:math';

import '../models/rewards.dart';

class RewardController {
  List<Reward> listOfRewards = [];

  void createReward(int rewardID, int rewardPointValue, String rewardName, String rewardDescription, bool isBought) {
    Reward reward = Reward.defaultConstructor(rewardID, rewardPointValue, rewardName, rewardDescription, isBought);
    listOfRewards.add(reward);
  }

  void updateReward(int rewardId, {
    String? rewardName,
    String? rewardDescription,
  }) {
    {
      final index = listOfRewards.indexWhere((reward) => reward.rewardID == rewardId);

      if (index >= 0) {
        // Use getters and setters to update properties
        if (rewardName != null) {
          listOfRewards[index].rewardName = rewardName;
        }

        if (rewardDescription != null) {
          listOfRewards[index].rewardDescription = rewardDescription;
        }
      }
    }
  }

  void deleteReward(int rewardId) {
    listOfRewards.removeWhere((reward) => reward.rewardID == rewardId);
  }

  List<Reward> getRewards() {
    return listOfRewards;
  }


  Reward generateRandomReward() {
    Random random = Random();

    int rewardId = random.nextInt(1000); // Random task ID
    int rewardPointValue = random.nextInt(10); // Random point value (0 to 9)
    String rewardName = "Reward $rewardId"; // You can customize this
    String rewardDescription = "Random reward description"; // You can customize this
    bool isBought = random.nextBool(); // Random completion status

    Reward randomReward = Reward.defaultConstructor(
      rewardId,
      rewardPointValue,
      rewardName,
      rewardDescription,
      isBought,
    );

    return randomReward;
  }
}