import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class EditProjectScreen extends StatelessWidget {
  EditProjectScreen({super.key});

  // Base Info Controllers
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController bootcampNameController = TextEditingController();
  final TextEditingController projectTypeController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController presentationDateController =
      TextEditingController();
  final TextEditingController projectDescriptionController =
      TextEditingController();

  // Links Controllers
  final TextEditingController githubController = TextEditingController();
  final TextEditingController figmaController = TextEditingController();
  final TextEditingController videoController = TextEditingController();
  final TextEditingController pinterestController = TextEditingController();
  final TextEditingController playStoreController = TextEditingController();
  final TextEditingController appleStoreController = TextEditingController();
  final TextEditingController apkController = TextEditingController();
  final TextEditingController webLinkController = TextEditingController();

  // Members Controllers
  final TextEditingController member1Controller = TextEditingController();
  final TextEditingController member2Controller = TextEditingController();
  final TextEditingController member3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          "Edit Project",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff4129B7),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Upload Logo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xff4129B7), // لون النص
                        ),
                      ),
                      const SizedBox(height: 10),
                      DottedBorder(
                        color: const Color(0xffD9D9D9),
                        strokeWidth: 1,
                        child: Container(
                            height: 76,
                            width: 76,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3)),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            )),
                      ),
                    ],
                  ),

                  // Upload Presentation Section
                  Column(
                    children: [
                      const Text(
                        "Upload Presentation",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xff4129B7),
                        ),
                      ),
                      const SizedBox(height: 10),
                      DottedBorder(
                        color: const Color(0xffD9D9D9),
                        strokeWidth: 1,
                        child: Container(
                            height: 76,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3)),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),

              // Text Fields Section
              _buildTextField("Project Name", projectNameController),
              const SizedBox(height: 16),
              _buildTextField("Bootcamp Name", bootcampNameController),
              const SizedBox(height: 16),
              _buildTextField("Type", projectTypeController),
              const SizedBox(height: 16),
              _buildTextField("Start Date", startDateController, isDate: true),
              const SizedBox(height: 16),
              _buildTextField("End Date", endDateController, isDate: true),
              const SizedBox(height: 16),
              _buildTextField("Presentation Date", presentationDateController,
                  isDate: true),
              const SizedBox(height: 16),
              _buildTextField(
                  "Project Description", projectDescriptionController,
                  isMultiline: true),

              const SizedBox(height: 20),
              const Divider(),
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
              _buildTextField("App Store", appleStoreController),
              const SizedBox(height: 10),
              _buildTextField("Figma", figmaController),
              const SizedBox(height: 10),
              _buildTextField("Web Link", webLinkController),
              const SizedBox(height: 10),
              _buildTextField("Pinterest", pinterestController),

              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),

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
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
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
              contentPadding: const EdgeInsets.all(16.0), // إضافة البادينق هنا
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
