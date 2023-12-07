import 'group_members.dart';

class group {
  int groupId;
  String groupName;
  List<Group_Members> members;

  group({
    required this.groupId,
    required this.groupName,
    List<Group_Members>? members})
      : members = members ?? [];
}
