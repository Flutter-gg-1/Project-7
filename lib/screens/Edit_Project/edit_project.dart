import 'package:flutter/material.dart';

class EditProjectScreen extends StatelessWidget {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController bootcampNameController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController presentationDateController =
      TextEditingController();
  final TextEditingController projectDescriptionController =
      TextEditingController();
  final TextEditingController projectTypeController =
      TextEditingController(text: "App");

  EditProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Project"),
        backgroundColor: const Color(0xff4129B7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Upload Logo Section
              const Text(
                "Upload Logo",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffD9D4F1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.upload_file,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Upload Presentation Section
              const Text(
                "Upload Presentation",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffD9D4F1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.upload_file,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              // Text Fields Section
              _buildTextField("Project Name", projectNameController),
              const SizedBox(height: 16),
              _buildTextField("Bootcamp Name", bootcampNameController),
              const SizedBox(height: 16),
              _buildTextField("Start Date", startDateController, isDate: true),
              const SizedBox(height: 16),
              _buildTextField("End Date", endDateController, isDate: true),
              const SizedBox(height: 16),
              _buildTextField("Presentation Date", presentationDateController,
                  isDate: true),
              const SizedBox(height: 16),
              _buildTextField("Type", projectTypeController),
              const SizedBox(height: 16),
              _buildTextField(
                  "Project Description", projectDescriptionController,
                  isMultiline: true),
              const SizedBox(height: 20),

              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Action to save the project details
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4129B7),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Save",
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isMultiline = false, bool isDate = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: isMultiline ? 5 : 1,
          keyboardType: isDate ? TextInputType.datetime : TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: isDate ? "Select a date" : "",
          ),
        ),
      ],
    );
  }
}
