import '../models/group.dart';
import '../models/group_members.dart';

class GroupController {
  List<group> groups = [];

  void addUserToGroup(Group_Members user, group group) {
    group.members.add(user);
  }

  void removeUserFromGroup(Group_Members user, group group) {
    group.members.remove(user);
  }
}
