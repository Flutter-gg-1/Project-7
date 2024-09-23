import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_judge/components/buttons/custom_icon_button.dart';
import 'package:project_judge/components/containers/custom_manage_users_container.dart';
import 'package:project_judge/components/text/custom_text.dart';
import 'package:project_judge/components/text_field/custom_text_form_field.dart';
import 'package:project_judge/screens/manage_user_screen/cubit/mange_user_cubit.dart';
import '../../components/app_bar/custom_app_bar.dart';

class ManageUserScreen extends StatelessWidget {
  const ManageUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MangeUserCubit(),
      child: Scaffold(
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
        body: BlocBuilder<MangeUserCubit, MangeUserState>(
          builder: (context, state) {
            final isSwitched =
                state is SwitchButtonState ? state.isSwitched : false;

            return ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: CustomText(
                    text:
                        "Switch to convert users from basic users to supervisors, and vice versa.",
                    size: 16,
                  ),
                ),
                const CustomTextFormField(
                  hintText: "Search for a user",
                  icon: Icons.search,
                ),
                const SizedBox(height: 26),
                CustomManageUsersContainer(
                  image: Image.asset(
                    "assets/images/profile_logo.png",
                    fit: BoxFit.contain,
                  ),
                  title: "User 1",
                  position: "Superviser",
                  isSwitched: isSwitched,
                  onChanged: (value) {
                    context.read<MangeUserCubit>().switchButton();
                  },
                ),
                CustomManageUsersContainer(
                  image: Image.asset(
                    "assets/images/profile_logo.png",
                    fit: BoxFit.contain,
                  ),
                  title: "User 2",
                  position: "User",
                  isSwitched: isSwitched,
                  onChanged: (value) {
                    context.read<MangeUserCubit>().switchButton();
                  },
                ),
                CustomManageUsersContainer(
                  image: Image.asset(
                    "assets/images/profile_logo.png",
                    fit: BoxFit.contain,
                  ),
                  title: "User 3",
                  position: "User",
                  isSwitched: isSwitched,
                  onChanged: (value) {
                    context.read<MangeUserCubit>().switchButton();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
