import 'package:flutter/material.dart';
import 'package:project_management_app/models/project_model.dart';
import 'package:project_management_app/screens/Edit_Project/edit_project.dart';
import 'package:project_management_app/theme/appcolors.dart';
import 'package:sizer/sizer.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final ProjectModel project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  String? selectedLink;
  List<String> links = [
    'GitHub',
    'Figma',
    'Video',
    'Pinterest Link',
    'PlayStore Link',
    'AppleStore Link',
    'Web Link',
    'Apk'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.blueDark,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProjectScreen()));
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 30),
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                ' Projects Details ..',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    color: Color(0xff57E3D8)),
              ),
              if (widget.project.logoUrl != null &&
                  widget.project.logoUrl != 'null')
                Flexible(
                  flex: 3,
                  child: Container(
                    height: 8.h,
                    width: 8.h,
                    decoration: BoxDecoration(
                      color: AppColors.blueDark,
                      borderRadius: BorderRadius.circular(1.4.h),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1.4,
                          blurRadius: 3.5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.network(
                        widget.project.logoUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.image,
                            size: 28,
                            color: Colors.white,
                          );
                        },
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) {
                            return child;
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              Image.asset('assets/Group 10 (1).png')
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          // First project name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Project name :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff4129B7),
                ),
              ),
              Text(
                widget.project.projectName.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffB8B8BB),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Second project name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'BootCamp  :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff4129B7),
                ),
              ),
              Text(
                widget.project.bootcampName.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffB8B8BB),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Third project name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Description :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff4129B7),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  widget.project.projectDescription.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB8B8BB),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Fourth project name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Start Date  :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff4129B7),
                ),
              ),
              Text(
                widget.project.startDate.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffB8B8BB),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'End Date  :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff4129B7),
                ),
              ),
              Text(
                widget.project.endDate.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffB8B8BB),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Presentaion Date :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff4129B7),
                ),
              ),
              Text(
                widget.project.presentationDate.toString(),
                style: const TextStyle(
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
                width: 170,
                height: 30,
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
                  width: 10), // Add spacing between dropdown and image
              Image.asset(
                'assets/Untitled 1.png', // Replace with your image path
                width: 150,
                height: 150,
              ),
            ],
          ),
          if (selectedLink != null)
            Text(
              widget.project.linksProject![links.indexOf(selectedLink!)].url
                  as String,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue),
            )
          else
            const Text('No Link Added'),
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
