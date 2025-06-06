import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController groupController = TextEditingController();
  FocusNode groupFocus = FocusNode();

  Rx<SummaryTab> selectedTab = SummaryTab.debts.obs;

  var myCosts = 0.0.obs;
  var totalCosts = 0.0.obs;

  double get owed => totalCosts.value - myCosts.value;

  var groupList = [];

  void changeTab(SummaryTab tab) {
    selectedTab.value = tab;
  }

  RxList<Member> members =
      <Member>[
        Member(
          name: 'Karina',
          avatar: 'https://avatar.iran.liara.run/public/girl?username=Karina',
        ),
        Member(
          name: 'Liam',
          avatar: 'https://avatar.iran.liara.run/public/boy?username=Liam',
        ),
        Member(
          name: 'Olivia',
          avatar: 'https://avatar.iran.liara.run/public/girl?username=Olivia',
        ),
        Member(
          name: 'Noah',
          avatar: 'https://avatar.iran.liara.run/public/boy?username=Noah',
        ),
        Member(
          name: 'Emma',
          avatar: 'https://avatar.iran.liara.run/public/girl?username=Emma',
        ),
        Member(
          name: 'Aiden',
          avatar: 'https://avatar.iran.liara.run/public/boy?username=Aiden',
        ),
      ].obs;
}

class Member {
  final String name;
  final String avatar;
  final double spent;
  final double balance;

  Member({
    required this.name,
    required this.avatar,
    this.spent = 0.0,
    this.balance = 0.0,
  });
}

enum SummaryTab { debts, balance, transactions }
