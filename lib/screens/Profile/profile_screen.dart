import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';
import 'package:project_management_app/data_layer/data_layer.dart';
import 'package:project_management_app/models/profile_model.dart';
import 'package:project_management_app/networking/api_networking.dart';
import 'package:project_management_app/screens/Edit_Profile/edit_profile_screen.dart';
import 'package:project_management_app/screens/Home/projects_contaner.dart';
import 'package:project_management_app/screens/Profile/custom_profile_links.dart';
import 'package:project_management_app/screens/Supervisor/add_project_screen.dart';
import 'package:project_management_app/services/setup.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final api = ApiNetworking();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color(0xff4129B7),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<Profile>(
        future: api.getProfile(locator.get<DataLayer>().auth!.token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          } else {
            Profile profile = snapshot.data!;
            List<String> labels = ['github', 'BlindLink', 'LinkedIn', 'Resume'];
            List<String> urls = [
              profile.link.github,
              profile.link.bindlink,
              profile.link.linkedin,
              profile.link.resume,
            ];
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    Text(profile.id),
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
                                border:
                                    Border.all(color: Colors.white, width: 4)),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/R 2.png',
                                width: 68,
                                height: 68,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                          color: const Color(0xff828181),
                                          width: 2),
                                    ]),
                              ),
                              Center(
                                child: OutlinedText(
                                    text: Text(
                                      '${profile.firstName} ${profile.lastName}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    strokes: [
                                      OutlinedTextStroke(
                                          color: const Color(0xff828181),
                                          width: 2),
                                    ]),
                              ),
                              Center(
                                child: OutlinedText(
                                    text: Text(
                                      profile.role,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    strokes: [
                                      OutlinedTextStroke(
                                          color: const Color(0xff828181),
                                          width: 2),
                                    ]),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EditProfileScreen()));
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          height: 41,
                          width: 144,
                          decoration: BoxDecoration(
                              color: const Color(0xff4129B7),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Accounts:',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        Image.asset('assets/Group 58.png')
                      ],
                    ),
                    const SizedBox(height: 20),
                    ...List.generate(4, (index) {
                      return CustomProfileLinks(
                        label: labels[index],
                        url: urls[index],
                      );
                    }),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            margin: const EdgeInsets.only(left: 5),
                            height: 41,
                            width: 144,
                            decoration: BoxDecoration(
                                color: const Color(0xff4129B7),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'My projects:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          if(profile.role == 'supervisor')
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AddProjectScreen(), // Define your details screen here
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xff4129B7),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.add, size: 20),
                                SizedBox(width: 5),
                                Text('Add Project'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...List.generate(profile.projects.length, (index) {
                      return Row(
                        children: [
                          Projects(
                            project: profile.projects[index],
                          ),
                          const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )
                        ],
                      );
                    }),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
