import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:outlined_text/outlined_text.dart';
import 'package:project_management_app/data_layer/data_layer.dart';
import 'package:project_management_app/models/link_model.dart';
import 'package:project_management_app/models/profile_model.dart';
import 'package:project_management_app/networking/api_networking.dart';
import 'package:project_management_app/screens/Edit_Profile/custom_edit_links.dart';
import 'package:project_management_app/services/setup.dart';

class EditProfileScreen extends StatefulWidget {
  final Profile profile;
  const EditProfileScreen({super.key, required this.profile});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<String> userInfo = ['First Name', 'Last Name'];
  List<String> socialAccounts = ['github', 'BlindLink', 'LinkedIn'];
  List<TextEditingController> controllers = [];

  File? profileImage;
  File? resumeFile;

  @override
  void initState() {
    controllers = [
      TextEditingController(text: widget.profile.firstName),
      TextEditingController(text: widget.profile.lastName),
      TextEditingController(text: widget.profile.link.github),
      TextEditingController(text: widget.profile.link.bindlink),
      TextEditingController(text: widget.profile.link.linkedin),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title:
            const Text("Edit Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff4129B7),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
          child: Column(
            children: [
              Container(
                height: 82,
                width: 319,
                decoration: BoxDecoration(
                    color: const Color(0xff4129B7),
                    borderRadius: BorderRadius.circular(37)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 68,
                        width: 68,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white, width: 4)),
                        child: ClipOval(
                            child: Image.asset(
                          'assets/pfp.png',
                          width: 68,
                          height: 68,
                          fit: BoxFit.cover,
                        ))),
                    const SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: OutlinedText(
                          text: const Text(
                            'Welcome Back !',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          strokes: [
                            OutlinedTextStroke(
                                color: const Color(0xff828181), width: 2),
                          ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My Info:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff57E3D8)),
                  )),
              ...List.generate(userInfo.length, (index) {
                return CustomEditLinks(
                  controller: controllers[index],
                  label: userInfo[index],
                );
              }),
              const SizedBox(
                height: 20,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Social Accounts:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff57E3D8)),
                  )),
              ...List.generate(socialAccounts.length, (index) {
                return CustomEditLinks(
                  controller: controllers[2 + index],
                  label: socialAccounts[index],
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Profile Image: ',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff4129B7),
                          fontWeight: FontWeight.bold)),
                  DottedBorder(
                    color: const Color(0xffD9D9D9),
                    strokeWidth: 1,
                    child: Container(
                        height: 76,
                        width: 211,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3)),
                        child: profileImage == null
                            ? IconButton(
                                onPressed: () async {
                                  _pickProfileImage();
                                },
                                icon: const Icon(Icons.file_present,
                                    color: Colors.black),
                              )
                            : const Icon(Icons.check_box)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Upload resume: ',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff4129B7),
                          fontWeight: FontWeight.bold)),
                  DottedBorder(
                    color: const Color(0xffD9D9D9),
                    strokeWidth: 1,
                    child: Container(
                        height: 76,
                        width: 211,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3)),
                        child: resumeFile == null
                            ? IconButton(
                                onPressed: () async {
                                  _pickResume();
                                },
                                icon: const Icon(Icons.file_present,
                                    color: Colors.black),
                              )
                            : const Icon(Icons.check_box)),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  height: 30,
                  width: 170,
                  child: ElevatedButton(
                    onPressed: () {
                      _saveUpdate();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4129B7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Save",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        profileImage = File(image.path);
      });
    }
  }

  Future<void> _pickResume() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        resumeFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _saveUpdate() async {
    if (profileImage != null && resumeFile != null) {
      try {
        Uint8List image = await profileImage!.readAsBytes();
        Uint8List resume = await resumeFile!.readAsBytes();
        await ApiNetworking().updateProfile(
          token: locator.get<DataLayer>().auth!.token,
          firstName: controllers[0].text,
          lastName: controllers[1].text,
          image: image.toList(),
          cv: resume.toList(),
          accounts: {
            'github': controllers[2].text,
            'linkedin': controllers[3].text,
            'bindlink': controllers[4].text,
          },
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Updated successfully!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update.')),
        );
      }
    }
  }
}
