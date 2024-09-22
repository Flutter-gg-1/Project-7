import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_management_app/data_layer/data_layer.dart';
import 'package:project_management_app/networking/api_networking.dart';
import 'package:project_management_app/services/setup.dart';
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
  bool isEditable = false;

  Future<void> _createProject(
      {required String token,
      required String userId,
      required String timeEndEdit}) async {
    log(locator.get<DataLayer>().auth!.token);
    if (userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a User ID')),
      );
      return;
    }

    try {
      await apiNetworking.createProject(
        token: token,
        userId: userId,
        timeEndEdit: timeEndEdit,
        isEditable: isEditable,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Project Created Successfully!!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add Project",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color(0xff4129B7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    TextField(
                      controller: _timeEndEditController,
                      decoration:
                          const InputDecoration(labelText: 'Time End Edit'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Editable: ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Switch(
                          value: isEditable,
                          onChanged: (value) {
                            setState(() {
                              isEditable = value;
                            });
                          },
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
                            _createProject(
                                token: locator.get<DataLayer>().auth!.token,
                                timeEndEdit: _timeEndEditController.text,
                                userId: _userIdController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff4129B7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Create Project",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
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
