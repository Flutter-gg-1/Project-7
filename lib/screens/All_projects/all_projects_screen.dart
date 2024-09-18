import 'package:flutter/material.dart';
import 'package:project_management_app/models/profile_model.dart';
import 'package:project_management_app/models/project_model.dart';
import 'package:project_management_app/networking/api_networking.dart';
import 'package:project_management_app/screens/Home/projects_contaner.dart';
import 'package:project_management_app/screens/Supervisor/add_project_screen.dart';
import 'package:project_management_app/theme/appcolors.dart';
import 'package:sizer/sizer.dart';

class AllProjectsScreen extends StatefulWidget {
  const AllProjectsScreen({super.key});

  @override
  State<AllProjectsScreen> createState() => _AllProjectsScreenState();
}

class _AllProjectsScreenState extends State<AllProjectsScreen>
    with TickerProviderStateMixin {
  late Future<List<ProjectModel>> _allProjectsFuture;
  late TabController _tabController;
  final ApiNetworking apiNetworking = ApiNetworking();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3); // Add a length
    _allProjectsFuture = apiNetworking.getAllPublicProjects();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildProjectsTab(Future<List<ProjectModel>> futureProjects) {
    return FutureBuilder<List<ProjectModel>>(
      future: futureProjects,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator()); // Show loading indicator
        } else if (snapshot.hasError) {
          return Center(
              child: Text('Error: ${snapshot.error}')); // Show error message
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No projects available.'));
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final project = snapshot.data![index];
            return Projects(
              project: project,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // Define the action for the "Add" button here
              // For example, navigate to a new project creation screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const AddProjectScreen()), // Replace with your desired screen
              );
            },
          ),
        ],
        title: const Text('All Projects',
            style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.blueDark,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.sp),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
              height: 20,
            ),
            Expanded(
              child: _buildProjectsTab(_allProjectsFuture),
            ),
          ],
        ),
      ),
    );
  }
}
