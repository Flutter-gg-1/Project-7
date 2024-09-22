import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_judge/components/buttons/custom_elevated_button.dart';
import 'package:project_judge/components/text_field/custom_text_form_field.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/models/user_model.dart';
import 'package:project_judge/network/api_netowrok.dart';
import 'package:project_judge/screens/edit_profile.dart/edit_profile.dart';
import 'package:project_judge/screens/profile_screen/cubit/profile_screen_cubit.dart';
import 'package:project_judge/setup/init_setup.dart';
import 'package:simple_icons/simple_icons.dart';
import '../../components/app_bar/custom_app_bar.dart';
import '../../components/text/custom_text.dart';
import 'dart:io';
import 'package:open_filex/open_filex.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = getIt.get<DataLayer>().userInfo!; // Get user info

    return BlocProvider(
      create: (context) => ProfileScreenCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xff4E2EB5),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF4E2EB5),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.exit_to_app,
                  color: Color(0xffffffff),
                ))
          ],
        ),
        body: BlocBuilder<ProfileScreenCubit, ProfileScreenState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Container(
                    width: 140, // Double the radius for correct sizing
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(
                            0xffffffff), // Change to your desired border color
                        width: 4, // Set the border width
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: user.imageUrl == null
                          ? const AssetImage("assets/images/default_img.png")
                          : NetworkImage(user.imageUrl!) as ImageProvider,
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: CustomText(
                    text: user.id!,
                    size: 12,
                    color: const Color.fromARGB(133, 255, 255, 255),
                    weight: FontWeight.w500,
                  )),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: user.firstName!,
                        size: 24,
                        color: Colors.white,
                        weight: FontWeight.w500,
                      ),
                      CustomText(text: ' '),
                      CustomText(
                        text: user.lastName!,
                        size: 24,
                        color: Colors.white,
                        weight: FontWeight.w500,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: const Color(0xff848484).withOpacity(0.5848484),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      SimpleIcons.github,
                      color: Color(0XFFFFFFFF),
                    ),
                    title: CustomText(
                        text: user.link!.github ?? 'Not added yet',
                        size: 14,
                        color: const Color(0xffffffff)),
                  ),
                  ListTile(
                    leading: Icon(
                      SimpleIcons.linkedin,
                      color: Color(0XFFFFFFFF),
                    ),
                    title: CustomText(
                        text: user.link!.linkedin ?? 'Not added yet',
                        size: 14,
                        color: const Color(0xffffffff)),
                  ),
                  ListTile(
                    leading: Icon(
                      SimpleIcons.github,
                      color: Color(0XFFFFFFFF),
                    ),
                    title: CustomText(
                        text: user.link!.bindlink ?? 'Not added yet',
                        size: 14,
                        color: const Color(0xffffffff)),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Color(0XFFFFFFFF),
                    ),
                    title: CustomText(
                        text: user.email ?? 'Not added yet',
                        size: 14,
                        color: const Color(0xffffffff)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: const Color(0xff848484).withOpacity(0.5848484),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // user.link!.resume != null ?
                  //SHOW FILE
                  // : CustomText(
                  //     text: 'No resume',
                  //     size: 14,
                  //     color: const Color(0xffffffff)),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()));
                      },
                      minimumSize: const Size(350, 63),
                      backgroundColor: const Color(0xff58E4D9),
                      text: "Edit Profile",
                      textcolor: const Color(0xff5030B6)),
                  const SizedBox(
                    height: 14,
                  ),
                  if (user.role == 'admin')
                    CustomElevatedButton(
                        onPressed: () {},
                        minimumSize: const Size(350, 63),
                        backgroundColor: Colors.white,
                        text: "Manage Users",
                        textcolor: const Color(0xff5030B6))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
