import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spiltify/app/routes/app_pages.dart';
import 'package:spiltify/app/theme/app_colors.dart';
import 'package:spiltify/app/widgets/common_app_bar.dart';
import 'package:spiltify/app/widgets/common_button.dart';
import 'package:spiltify/app/widgets/common_text.dart';
import 'package:spiltify/app/widgets/common_text_input_field.dart';

import 'group_split_controller.dart';

class GroupSplitView extends GetView<GroupSplitController> {
  const GroupSplitView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Who we split among"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              LinearProgressIndicator(value: 0.5, backgroundColor: Colors.grey[300], color: secondaryClr),

              SizedBox(height: 24),
              // Group name
              CommonTextField(controller: controller.groupNameController,hintText: "Group Name*",),
              SizedBox(height: 24),

              CommonText.semiBold("Members",size: 18),

              SizedBox(height: 12),

              // Member list
              Expanded(
                child: Obx(() => ListView.builder(
                  itemCount: controller.members.length + 1,
                  itemBuilder: (context, index) {
                    if (index == controller.members.length) {
                      return _buildNewMemberTile(context);
                    }
                    final member = controller.members[index];
                    return _buildMemberTile(member, index);
                  },
                )),
              ),

              SizedBox(height: 16),
              // Buttons
              Row(
                children: [
                  Expanded(
                    child: CommonButton.outline(
                      onPressed: () => Get.back(),
                      text: "Back",
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: CommonButton(
                      onPressed: () {
                        Get.toNamed(Routes.SPLIT,arguments: {
                          "from":controller.isScanned?"scan":"desc"
                        });
                      },
                      text: "Next",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMemberTile(Member member, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: member.avatarUrl != null ? AssetImage(member.avatarUrl!) : null,
            child: member.avatarUrl == null ? Text(member.name[0]) : null,
          ),
          SizedBox(width: 12),
          Expanded(child: Text(member.name, style: TextStyle(fontSize: 16))),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => controller.removeMember(index),
          )
        ],
      ),
    );
  }

  Widget _buildNewMemberTile(BuildContext context) {
    return InkWell(
      onTap: () => _showAddMemberDialog(context),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: outlineClr.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.person_add_alt, color: onSurfaceClr),
            SizedBox(width: 12),
            CommonText.medium("New member",size: 14),
          ],
        ),
      ),
    );
  }

  void _showAddMemberDialog(BuildContext context) {
    String name = "";
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Add New Member"),
        content: TextField(
          onChanged: (val) => name = val,
          decoration: InputDecoration(labelText: "Name"),
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              if (name.trim().isNotEmpty) {
                controller.addMember(name.trim());
              }
              Get.back();
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }
}
