import 'package:flutter/material.dart';
import 'package:project_judge/components/buttons/custom_icon_button.dart';
import 'package:project_judge/components/containers/custom_manage_users_container.dart';
import 'package:project_judge/components/text/custom_text.dart';
import 'package:project_judge/components/text_field/custom_text_form_field.dart';

import '../../components/app_bar/custom_app_bar.dart';

class ManageUserScreen extends StatefulWidget {
  const ManageUserScreen({super.key});

  @override
  State<ManageUserScreen> createState() => _ManageUserScreenState();
}

class _ManageUserScreenState extends State<ManageUserScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          text: 'Manage Users',
          actions: [
            CustomIconButton(
              icon: const Icon(Icons.check_rounded),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: CustomText(
                  text:
                      "Switch to convert users from basic users to supervisors, and vice versa.",
                  size: 16),
            ),
            const CustomTextFormField(
                hintText: "Search for a user", icon: Icons.search),
            const SizedBox(
              height: 26,
            ),
            CustomManageUsersContainer(
              image: Image.asset(
                "assets/images/profile_logo.png",
                fit: BoxFit.contain,
              ),
              title: "Name",
              position: "Superviser",
            ),
            CustomManageUsersContainer(
              image: Image.asset(
                "assets/images/profile_logo.png",
                fit: BoxFit.contain,
              ),
              title: "Name",
              position: "User",
            ),
            CustomManageUsersContainer(
              image: Image.asset(
                "assets/images/profile_logo.png",
                fit: BoxFit.contain,
              ),
              title: "Name",
              position: "User",
            ),
          ],
        ));
  }
}
