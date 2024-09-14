import 'package:flutter/material.dart';
import 'package:project_management_app/screens/Home/projects_contaner.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              ListTile(
                minLeadingWidth: 80,
                leading: const Text(
                  'github: ',
                  style: TextStyle(fontSize: 14, color: Color(0xff4129B7)),
                ),
                title: Container(
                  padding: const EdgeInsets.only(left: 5),
                  height: 33,
                  width: 250,
                  decoration: BoxDecoration(
                      color: const Color(0xffD9D4F1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'add links:',
                        style: TextStyle(
                            fontSize: 11,
                            color: const Color(0xff4129B7).withOpacity(0.5),
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              ListTile(
                minLeadingWidth: 80,
                leading: const Text('blindLink: ',
                    style: TextStyle(fontSize: 14, color: Color(0xff4129B7))),
                title: Container(
                  padding: const EdgeInsets.only(left: 5),
                  height: 33,
                  width: 250,
                  decoration: BoxDecoration(
                      color: const Color(0xffD9D4F1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'add links:',
                        style: TextStyle(
                            fontSize: 11,
                            color: const Color(0xff4129B7).withOpacity(0.5),
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              ListTile(
                minLeadingWidth: 80,
                leading: const Text('LinkedIn: ',
                    style: TextStyle(fontSize: 14, color: Color(0xff4129B7))),
                title: Container(
                  padding: const EdgeInsets.only(left: 5),
                  height: 33,
                  width: 250,
                  decoration: BoxDecoration(
                      color: const Color(0xffD9D4F1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'add links:',
                        style: TextStyle(
                            fontSize: 11,
                            color: const Color(0xff4129B7).withOpacity(0.5),
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              ListTile(
                minLeadingWidth: 80,
                leading: const Text('resume: ',
                    style: TextStyle(fontSize: 14, color: Color(0xff4129B7))),
                title: Container(
                  padding: const EdgeInsets.only(left: 5),
                  height: 33,
                  width: 250,
                  decoration: BoxDecoration(
                      color: const Color(0xffD9D4F1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'add links:',
                        style: TextStyle(
                            fontSize: 11,
                            color: const Color(0xff4129B7).withOpacity(0.5),
                            fontWeight: FontWeight.bold),
                      )),
                ),
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
                          'My projects:',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  TextButton(
                      onPressed: () {}, child: const Text('see more..>')),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ...List.generate(3, (_) {
                return const Projects();
              })
            ],
          ),
        ),
      ),
    );
  }
}
