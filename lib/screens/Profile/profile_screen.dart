import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';
import 'package:project_management_app/models/profile_model.dart';
import 'package:project_management_app/networking/api_networking.dart';
import 'package:project_management_app/screens/Edit_Profile/edit_profile_screen.dart';
import 'package:project_management_app/screens/Home/projects_contaner.dart';
import 'package:project_management_app/screens/Profile/custom_profile_links.dart';
import 'package:project_management_app/screens/Supervisor/add_project_screen.dart';

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
      backgroundColor: Colors.white,
      body: FutureBuilder<Profile>(
        future: api.getProfile(
            'YWU1YzhkZmU4MWI3NWE1Y2Y3MzQ0ZjQwNTg2NmQwOWI4MWUwZTExZjQyNDNlNTI1YzRiNDAzMDBiZDE0YWQ0MTIxMTBmNGNhYjgyZjIwZDU4NmYyMjllNmY0MmY2ZTE1ZDEzODAwNTQ3ODc0MzQ0YjU4MTNmNDljZGU1NmYyMjE1NDk3NjdhNzYyN2UxZWMzYjQ0NGZhZDZhMzA0OTY4M2QwMDYyYmEzZjAzMzU5OWIyMDNjODVjZDQyYTRiYjk4YjU2NzYxZDFlYmVkNzExZGU4ZjAyNGE1NjAxMTg2ZjE0Yjc1MjIwNGM0MDdkYmNmZTc2NWJlYzY4MDU0ZjAzYmNmZGY3NWM1ZDgxZGYwZWE1ZDllOTc1MDIxMTVhNWI4YjU5ODAyMTM0MTc2NmRjYjA3ZjE4ZDZlMmRlM2M0ZThjODc3OTFjNGMyOTUwYjE5MmVjMzJlMTZkN2JiNDRhNWI3NzU0MDIyYTdmODk3MzE3NWQ1MzM5NTUzODNhYmExZGY1MzE5OTY0YWYwYjc0MmMxZThmNTI4YmZiODNlMTE1OTE3ZTZjYjMyMWQ2NmJlNDA5YTA2Y2RmYTFkZWRhNzE5ZTU2MTFlMGIyN2NjMDE1MjI5ZmM1ZGVkYTgxMjViZDNjZmVmM2M4MDg5NjA4OWJlMGE0M2NjY2E2MDc0ZmYyZTQ5MDVhM2RmMDI2ZDU4NDhiNDhmYzBkYjY1MGFlMGY3NzFiZTlkOWU4OGQ0ZDk5YzNkODkxNWNjMGRhNzdlOGZiNWY1NzNlMGFkNWU1N2U0MWZjODQ0MzhjYWJmZThlZGVkYWI1ODQ2OTIzNzE4MDFhZWZmZGRkZTkzMmVlN2FmMTgzMjA0ZmMxZDMxMmMzYWU5YzRkNGZhOGMwMzg4NmI4NDU3ODg5YjlhMGM1Zjk4YWU0N2EwNjVhYTcwMmU1OGI4NmRiNTk1ODRjNzM5MjBkODY2MGRiYzRkNjk4MjA3OGMwYWIxNjA0NzgzOTk4NTE3NmFkYjE2ZGRiZjdlNTMwOGVhYmM3ODc3YmI2YWIxMTQzMjczMzBjMjljZmU1OTc5ZDMzYzViN2IzZmI0YzMxZjQ1ZjhiMDZmZDVjMTczZjQzN2RlZjM1MGE0NmY1OTc0NjFjNTY3MmZjOWI1ZmQ0OTRhNjUyMmQyZWY0YmE0NDM5YzA2NDRmMzA0YWEzODk1ZDQyYWUzOWRiMTVlNjBjYWZmODkzNjRjZjI3MTMzMzI4ZTIwNWU1OTc4YmNkODJkMGVlMzVlODc4OTg4OTg5OWI5ZmVjZjRiNzZiZGE3NmMzNTBlOWM2ZDJiODgwNThkNWYwYjZiMmQzY2YxMTJkYjY2YzQwMTE0YWU5YmM1NmU4ODZiN2UzNTc1NjE4ZWZlMjQ0YmY2ZTFmMTc4ZmY2ODI5MTljNjk5YzNmOGM2ZTI4NDM4NzkzNmRlNTk2YzUxMDk3ODE4MGIzYTY2OTk5OWE0Y2JjZGZjODg1ZTU5ZTU0NTU4YjllNzhhZmM5OTNlZjA5NWQ5MTA5OTUwZGNlMzk5ZjgwZGVmYzRjNDlkMDE4YWQ1ODM3YTc0N2QyOWJiMTZiNDEyN2M5ZDY1NGYzMDRmMWU1OWI2YzhlYzUyNTYyZTA1MjkxMmJiM2RjZjM3NmI1MzYwNDcxZDc0NDMzNDJlMDUyNDVmYWIzMjIzNDZjZmQ2NmJmNjFlY2E0YzVkM2I0NThjYTU0ZjdkZWIxODc2MjkxMDY5MGU1YTQwMGY3NmVmYzAzNzY4NmZhYjc1MDY2NTNiMmJhNzQ1NGE0OGU3ZTFiZDg5NWE3ZDVkOTk2ZTQxNmExMjY0ZjNlMTA0N2Y5ZGM2ZDA1NmI5ZDM3YzU4YjkwYTA0Zjc0ZmI3MTU5ZTM4Nzk1ZDBkOTRlZDRlMGM4YTc4ZjI2MjA4YTQ1YjY1MTE4YWRjNWY0YWM2NDhmNWQ4YjI2YzI0OTFiNmJkZTE3N2U3ZWJlMzc0ZDBkMTMxODEzZGJkY2QwMWZjYzc1NzQ2ODlhNWI1ZGYyZTE1NWZkNDc4N2MxODRjYzA1Mjg4ZWU0OTdhMTFkMmU4MjEwMjhjZDBlZjBiZGI0MDUxNThmYjdmODc3Yjk0OTBlZTVkNjViZjUyMzhjYWY4YjZiMjk4YzIyY2M2ZDEzYTRmNzYzNzRhYmExYjVkZTJiZTIwYTNjODI3M2I4MzZiZjc0ODJmMTkxZDU2NWQ3ODJiZWZlYTQ5OGU5MTY1ZDZkZTY1'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: const Text('No data available'));
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
                      return Projects(
                        project: profile.projects[index],
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
