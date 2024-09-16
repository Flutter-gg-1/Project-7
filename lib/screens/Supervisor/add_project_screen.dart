import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project_management_app/networking/api_networking.dart';
import 'package:project_management_app/models/project_model.dart';
import 'package:project_management_app/screens/Supervisor/custom_add_card.dart';
import 'package:sizer/sizer.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  _AddProjectScreenState createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final ApiNetworking apiNetworking = ApiNetworking();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _timeEndEditController = TextEditingController();
  bool _isEditable = false;

  Future<void> _createProject() async {
    final String token =
        'YWU1YzhkZmU4MWI3NWE1Y2Y3MzQ0ZjQwNTg2NmQwOWI4MWUwZTExZjQyND...';
    final String userId = _userIdController.text;
    print(_userIdController.text);
    final String timeEndEdit = _timeEndEditController.text;

    if (userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a User ID')),
      );
      return;
    }

    try {
      log('Creating project with userId: $userId, timeEndEdit: $timeEndEdit, isEditable: $_isEditable');

      ProjectModel newProject = await apiNetworking.createProject(
        token: token,
        userId: userId,
        timeEndEdit: timeEndEdit,
        isEditable: _isEditable,
      );

      // عرض رسالة النجاح
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Project Created: ${newProject.projectName}')),
      );
    } catch (e) {
      // تسجيل الخطأ لمزيد من التفاصيل
      log('Error occurred: $e');

      // عرض رسالة الخطأ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          // يجب استخدام Column أو Row هنا ليحتوي على Expanded
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    // Expanded الآن داخل Row
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _userIdController,
                        decoration: InputDecoration(
                          hintText: 'User ID',
                          prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Image.asset(
                    scale: 3,
                    'assets/Group 10 (1).png',
                  ),
                ],
              ),
            ),
            Expanded(
              // Expanded هنا داخل Column
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomAddCard(),
                    const SizedBox(height: 40),
                    TextField(
                      controller: _timeEndEditController,
                      decoration:
                          const InputDecoration(labelText: 'Time End Edit'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Editable: '),
                        Switch(
                          value: _isEditable,
                          onChanged: (value) {
                            setState(() {
                              _isEditable = value;
                            });
                          },
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: _createProject,
                      child: const Text('Create Project'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
