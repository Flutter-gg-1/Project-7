import 'package:flutter/material.dart';
import 'package:project_management_app/models/member_model.dart';

class MemberFiled extends StatelessWidget {
 final List<MemberModel> members;
  final List<TextEditingController> positionControllers;
  final List<TextEditingController> userIdControllers;
  final Function addMember;
  final Function removeMember;

  const MemberFiled({
    required this.members,
    required this.positionControllers,
    required this.userIdControllers,
    required this.addMember,
    required this.removeMember,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // Existing code for member fields
    );
  }
}