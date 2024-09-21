import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_judge/components/buttons/custom_elevated_button.dart';
import 'package:project_judge/components/text_field/custom_text_form_field.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/network/api_netowrok.dart';
import 'package:project_judge/screens/profile_screen/cubit/profile_screen_cubit.dart';
import 'package:project_judge/setup/init_setup.dart';
import 'package:simple_icons/simple_icons.dart';
import '../../components/app_bar/custom_app_bar.dart';
import '../../components/text/custom_text.dart';
import 'dart:io';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController bindlink = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ApiNetowrok api = ApiNetowrok();

    return BlocProvider(
      create: (context) => ProfileScreenCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xff4E2EB5),
        appBar: const CustomAppBar(
          text: 'Profile',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25,
          ),
          child: BlocBuilder<ProfileScreenCubit, ProfileScreenState>(
            builder: (context, state) {
              File? image;
              if (state is ImageSelected) {
                image = state.image;
              }
              return ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                            child: image == null
                                ? Image.asset(
                                    "assets/images/profile_logo.png",
                                    fit: BoxFit.contain,
                                  )
                                : ClipOval(
                                    child: Image.file(
                                      image,
                                      fit: BoxFit.cover,
                                      width: 150,
                                      height: 150,
                                    ),
                                  )),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.read<ProfileScreenCubit>().pickImage();
                          },
                          child: const Icon(Icons.image_search_rounded))
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomTextFormField(
                      controller: firstname,
                      hintText: "First Name",
                      icon: Icons.person_outline_rounded),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      controller: lastname,
                      hintText: "Last Name",
                      icon: Icons.person_outline_rounded),
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
                  CustomTextFormField(
                      controller: bindlink,
                      hintText: "Example//example.com",
                      icon: SimpleIcons.github),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomTextFormField(
                      hintText: "Example//example.com",
                      icon: SimpleIcons.linkedin),
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
                      onPressed: () {
                        log(getIt.get<DataLayer>().authUser!.token);
                        api.updateProfile(
                            img: image!.readAsBytesSync(),
                            token: getIt.get<DataLayer>().authUser!.token,
                            first_name: firstname.text,
                            last_name: lastname.text,
                            bindlink: bindlink.text);
                      },
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
              );
            },
          ),
        ),
      ),
    );
  }
}
