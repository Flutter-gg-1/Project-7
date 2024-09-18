import 'package:flutter/material.dart';
import 'package:project_judge/components/buttons/custom_elevated_button.dart';
import 'package:project_judge/components/text_field/custom_text_form_field.dart';
import 'package:simple_icons/simple_icons.dart';

import '../../components/app_bar/custom_app_bar.dart';
import '../../components/text/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4E2EB5),
      appBar: const CustomAppBar(
        text: 'Profile',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
        ),
        child: ListView(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: Center(
                child: Image.asset(
                  "assets/images/profile_logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const CustomTextFormField(
                hintText: "First Name", icon: Icons.person_outline_rounded),
            const SizedBox(
              height: 8,
            ),
            const CustomTextFormField(
                hintText: "Last Name", icon: Icons.person_outline_rounded),
            const SizedBox(
              height: 32,
            ),
            Divider(
              color: const Color(0xff848484).withOpacity(0.5848484),
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: CustomText(
                text: "My Accounts",
                size: 24,
                color: Colors.white,
                weight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const CustomTextFormField(
                hintText: "Example//example.com", icon: SimpleIcons.github),
            const SizedBox(
              height: 8,
            ),
            const CustomTextFormField(
                hintText: "Example//example.com", icon: SimpleIcons.linkedin),
            const SizedBox(
              height: 8,
            ),
            const CustomTextFormField(
              hintText: "Example//example.com",
              icon: Icons.email,
            ),
            const SizedBox(
              height: 8,
            ),
            const CustomTextFormField(
                hintText: "Example//example.com",
                icon: Icons.sticky_note_2_rounded),
            const SizedBox(
              height: 25,
            ),
            CustomElevatedButton(
                onPressed: () {},
                minimumSize: const Size(350, 63),
                backgroundColor: const Color(0xff58E4D9),
                text: "Save Changes",
                textcolor: const Color(0xff5030B6)),
            const SizedBox(
              height: 16,
            ),
            CustomElevatedButton(
                onPressed: () {},
                minimumSize: const Size(350, 63),
                backgroundColor: Colors.white,
                text: "Manage Users",
                textcolor: const Color(0xff5030B6))
          ],
        ),
      ),
    );
  }
}
