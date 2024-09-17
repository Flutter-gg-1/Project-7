import 'package:flutter/material.dart';
import 'package:project_management_app/theme/appcolors.dart';

class ProjectDetailsScreen extends StatefulWidget {
  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  String? selectedLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.blueDark),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 100.0),
                child: Text(
                  ' Projects Details ..',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: Color(0xff57E3D8)),
                ),
              ),
              Image.asset('assets/Group 10 (1).png')
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          // First project name
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Project name :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff4129B7),
                ),
              ),
              Text(
                'Project 7',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffB8B8BB),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Second project name
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'BootCamp  :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff4129B7),
                ),
              ),
              Text(
                'Project 7',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffB8B8BB),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Third project name
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Description :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff4129B7),
                ),
              ),
              Text(
                'Project 7',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffB8B8BB),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Fourth project name
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Start Date  :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff4129B7),
                ),
              ),
              Text(
                'Project 7',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffB8B8BB),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'End Date  :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff4129B7),
                ),
              ),
              Text(
                'Project 7',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffB8B8BB),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Presentaion Date :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff4129B7),
                ),
              ),
              Text(
                'Project 7',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffB8B8BB),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          // Links dropdown button and image in a Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 139, // Set the width to 139
                height: 30, // Set the height to 30
                decoration: BoxDecoration(
                  color: const Color(0xff4129B7),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: DropdownButton<String>(
                  value: selectedLink,
                  isExpanded: true,
                  hint: const Text(
                    "Links",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  iconSize: 24, // Adjust the icon size
                  underline: Container(), // Remove default underline
                  dropdownColor: const Color(0xff4129B7),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLink = newValue;
                    });
                  },
                  items: <String>[
                    'GitHub',
                    'Figma',
                    'Video',
                    'Pinterest Link',
                    'PlayStore Link',
                    'AppleStore Link',
                    'Web Link',
                    'Apk'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                  width: 20), // Add spacing between dropdown and image
              Image.asset(
                'assets/Untitled 1.png', // Replace with your image path
                width: 150,
                height: 150,
              ),
            ],
          ),

          const SizedBox(
            height: 30,
          ),

          // Container to display images with shadow and rounded edges
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 200, // Set the height of the container
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/Group 63.png', // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
