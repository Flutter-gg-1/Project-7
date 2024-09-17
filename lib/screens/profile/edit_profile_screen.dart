import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project7/constants/app_constants.dart';
import 'package:project7/extensions/screen_navigation.dart';
import 'package:project7/extensions/screen_size.dart';
import 'package:project7/layers/auth_layer.dart';
import 'package:project7/models/profile_model.dart';
import 'package:project7/screens/profile/cubit/profile_cubit.dart';
import 'package:project7/widgets/buttons/profile_button.dart';
import 'package:project7/widgets/fields/edit_field.dart';
import 'package:project7/widgets/fields/edit_link_field.dart';

import 'package:image_picker/image_picker.dart';
import 'package:project7/widgets/icons/custom_icons_icons.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    super.key,
    required this.profile,
    required this.cubit,
  });
  final ProfileModel profile;
  final ProfileCubit cubit;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    TextEditingController fNameController =
        TextEditingController(text: profile.firstName);
    TextEditingController lNameController =
        TextEditingController(text: profile.lastName);
    TextEditingController resumeController =
        TextEditingController(text: profile.link?.resume);
    TextEditingController linkedinController =
        TextEditingController(text: profile.link?.linkedin);
    TextEditingController gitHubController =
        TextEditingController(text: profile.link?.github);
    TextEditingController bindlinkController =
        TextEditingController(text: profile.link?.bindlink);

    File? image;
    File? cv;
    String? imagePath = image?.path ?? profile.imageUrl;
    String? cvPath = cv?.path ?? profile.resumeUrl;

    return Scaffold(
      backgroundColor: const Color(0xffF6F4FB),
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: 92,
                width: 92,
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: cubit
                        .handleProfilePage(
                            logoUrl: profile.imageUrl, context: context)
                        .image),
              ),
              TextButton(
                  onPressed: () async {
                    final selectedImage = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    image = File(selectedImage!.path);
                    imagePath = image!.path;
                    profile.imageUrl = image?.path ?? profile.imageUrl;
                  },
                  child: const Text(
                    "Change image",
                    style: TextStyle(color: AppConstants.mainPurple),
                  )),
              const SizedBox(width: 12),
              ElevatedButton(
                  onPressed: () async {
                    cv = await pickerFile();
                    cvPath = cv!.path;
                  },
                  child: const Text('Upload cv')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EditField(lebal: "First Name", controller: fNameController),
                  EditField(lebal: "Last Name", controller: lNameController),
                ],
              ),
              const SizedBox(height: 22),
              Container(
                width: context.getWidth(divideBy: 1.1),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    EditLinkField(
                        icon: Icons.description_outlined,
                        hint: "Enter your Resume link",
                        controller: resumeController),
                    EditLinkField(
                        icon: CustomIcons.linkedin_in,
                        hint: "Linked in",
                        controller: linkedinController),
                    EditLinkField(
                        icon: CustomIcons.github,
                        hint: "GitHub",
                        controller: gitHubController),
                    EditLinkField(
                        icon: Icons.link,
                        hint: "Bindlink",
                        controller: bindlinkController),
                    ProfileButton(
                      color: AppConstants.mainPurple,
                      title: "Save",
                      onPressed: () {
                        {
                          log(imagePath ?? "no image");
                          log(profile.imageUrl ?? "no image");
                          log(profile.resumeUrl ?? "no image");
                          cubit.editProfile(
                              token: GetIt.I.get<AuthLayer>().auth!.token,
                              firstName: fNameController.text,
                              bindLink: bindlinkController.text,
                              cvPath: cvPath ?? profile.resumeUrl,
                              github: gitHubController.text,
                              imagePath: imagePath ?? profile.imageUrl,
                              lastName: lNameController.text,
                              linkedIn: linkedinController.text);

                          context.pop();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<File> pickerFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  File file = File(result!.files.single.path!);

  return file;
}
