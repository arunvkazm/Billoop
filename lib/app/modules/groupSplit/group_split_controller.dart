import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GroupSplitController extends GetxController {
  final groupNameController = TextEditingController();
  final members =
      <Member>[
        Member(name: "Anastasia", avatarUrl: "assets/anastasia.png"),
      ].obs;

  var isScanned = false;

  @override
  void onInit() {
    isScanned = Get.arguments["from"] == "scan"?true:false;
    super.onInit();
  }

  void addMember(String name, {String? avatarUrl}) {
    members.add(Member(name: name, avatarUrl: avatarUrl));
  }

  void removeMember(int index) {
    if (index >= 0 && index < members.length) {
      members.removeAt(index);
    }
  }
}

class Member {
  final String name;
  final String? avatarUrl;

  Member({required this.name, this.avatarUrl});
}
