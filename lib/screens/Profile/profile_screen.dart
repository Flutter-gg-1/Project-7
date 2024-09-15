import 'package:flutter/material.dart';
import 'package:project_management_app/screens/Home/projects_contaner.dart';
import 'package:project_management_app/screens/Profile/custom_profile_links.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> labels = ['github', 'BlindLink', 'LinkedIn', 'Resume'];
    List<String> urls = ['Add Links', 'Add Links', 'Add Links', 'Add Links'];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              Container(
                height: 82,
                width: 319,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(37)),
              ),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 20,
              ),
              Row(
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
                      // Action for adding a project
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xff4129B7),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.add, size: 20), // أيقونة الإضافة
                        SizedBox(width: 5), // مسافة صغيرة بين الأيقونة والنص
                        Text('Add Project'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ...List.generate(3, (_) {
                return const Projects();
              }),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
