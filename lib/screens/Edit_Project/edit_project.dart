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

  // Controllers for the new links section
  final TextEditingController githubController = TextEditingController();
  final TextEditingController playStoreController = TextEditingController();
  final TextEditingController appStoreController = TextEditingController();
  final TextEditingController figmaController = TextEditingController();
  final TextEditingController webLinkController = TextEditingController();
  final TextEditingController pinterestController = TextEditingController();

  // Controllers for members
  final TextEditingController member1Controller = TextEditingController();
  final TextEditingController member2Controller = TextEditingController();
  final TextEditingController member3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  color: Color(0xff4129B7), // لون النص
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffD9D4F1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: const Offset(5, 5), // الإزاحة للظل
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: const Offset(-5, 5), // ظل من اليسار
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.upload_file,
                  size: 50,
                  color: Color(0xff57E3D8),
                ),
              ),
              const SizedBox(height: 20),

              // Upload Presentation Section
              const Text(
                "Upload Presentation",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xff4129B7),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffD9D4F1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: const Offset(5, 5), // ظل من اليمين
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: const Offset(-5, 5), // ظل من اليسار
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.upload_file,
                  size: 50,
                  color: Color(0xff57E3D8),
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

              // Links Section
              const Text(
                "Links: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4129B7), // لون النص
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              _buildTextField("GitHub", githubController),
              const SizedBox(height: 10),
              _buildTextField("Play Store", playStoreController),
              const SizedBox(height: 10),
              _buildTextField("App Store", appStoreController),
              const SizedBox(height: 10),
              _buildTextField("Figma", figmaController),
              const SizedBox(height: 10),
              _buildTextField("Web Link", webLinkController),
              const SizedBox(height: 10),
              _buildTextField("Pinterest", pinterestController),
              const SizedBox(height: 30),

              // Members Section
              const Text(
                "Members",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xff4129B7), // لون النص
                ),
              ),
              const SizedBox(height: 10),
              _buildTextField("Member 1", member1Controller),
              const SizedBox(height: 10),
              _buildTextField("Member 2", member2Controller),
              const SizedBox(height: 10),
              _buildTextField("Member 3", member3Controller),
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
                  child: const Text("Save"),
                ),
              ),
              const SizedBox(height: 70),
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
            color: Color(0xff4129B7), // لون النص
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(5, 5),
              ),
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(-20, 10), // ظل من اليسار
              ),
            ],
          ),
          child: TextField(
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
        ),
      ],
    );
  }
}
