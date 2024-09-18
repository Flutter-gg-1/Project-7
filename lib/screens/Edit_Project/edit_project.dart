import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project_management_app/theme/appcolors.dart';

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
        title: const Text("Edit Project"),
        backgroundColor: AppColors.blueDark, // لون العلوم الأبيض
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Upload Logo Section
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                "Upload Logo",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.blueDark, // لون النص
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(3, 3), // الإزاحة للظل
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(-3, -3), // ظل من اليسار
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.upload_file,
                  size: 50,
                  color: Color(0xff57E3D8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Upload Presentation Section
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                "Upload Presentation",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xff4129B7),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(3, 3), // الإزاحة للظل
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(-3, -3), // ظل من اليسار
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.upload_file,
                  size: 50,
                  color: Color(0xff57E3D8),
                ),
              ),
            ),
            const SizedBox(height: 30),

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
        _buildTextField("Project Description", projectDescriptionController,
            isMultiline: true),

              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  height: 30,
                  width: 170,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4129B7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Save Basic Info",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),

              // upload project images
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Upload images",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff4129B7), // لون النص
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: DottedBorder(
                      color: const Color(0xffD9D9D9),
                      strokeWidth: 1,
                      child: Container(
                          height: 100,
                          width: 250,
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      height: 30,
                      width: 170,
                      child: ElevatedButton(
                        onPressed: () {
                          // Action to save the project details
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff4129B7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Save Images",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),

            // Links Section
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                "Links: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4129B7), // لون النص
                  fontSize: 18,
                ),
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                "Members :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.blueDark, // لون النص
                ),
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
                  backgroundColor: AppColors.blueLight,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isMultiline = false, bool isDate = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppColors.blueDark, // لون النص
                ),
              ),
              Container(
                // padding: const EdgeInsets.all(13.0),
                alignment: Alignment.bottomLeft,
                width: 190,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(3, 3),
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(-3, -3), // ظل من اليسار
                    ),
                  ],
                ),
                child: TextField(
                  textDirection: TextDirection.ltr,
                  controller: controller,
                  maxLines: isMultiline ? 5 : 1,
                  keyboardType:
                      isDate ? TextInputType.datetime : TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.all(16.0), // إضافة البادينق هنا
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
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
