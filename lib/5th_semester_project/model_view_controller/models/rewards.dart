class Reward {
  int _rewardID, _rewardPointValue;
  String _rewardName, _rewardDescription;
  bool _isBought;

  Reward.defaultConstructor(
      this._rewardID,
      this._rewardPointValue,
      this._rewardName,
      this._rewardDescription,
      this._isBought
      );

  Reward.test(
      this._rewardID,
      this._rewardName, {
        int rewardPointValue = 0,
        String rewardDescription = '',
        bool isBought = false,
      })  : _rewardPointValue = rewardPointValue,
        _rewardDescription = rewardDescription,
        _isBought = isBought;
  }

  bool get isBought => _isBought;
  set isBought(bool value) {
    _isBought = value;
  }

  String get rewardDescription => _rewardDescription;
  set rewardDescription(String value) {
    _rewardDescription = value;
  }


  String get rewardName => _rewardName;
  set rewardName(String value) {
    _rewardName = value;
  }


  int get rewardPointValue => _rewardPointValue;
  set rewardPointValue(int value) {
    _rewardPointValue = value;
  }


  int get rewardID => _rewardID;
  set rewardID(int value) {
    _rewardID = value;
  }
}
