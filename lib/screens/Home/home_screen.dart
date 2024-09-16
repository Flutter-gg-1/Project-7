import 'package:flutter/material.dart';
import 'package:project_management_app/models/project_model.dart';
import 'package:project_management_app/networking/api_networking.dart';
import 'package:project_management_app/screens/Home/boot_camps.dart';
import 'package:project_management_app/screens/Home/image_slider.dart';
import 'package:project_management_app/screens/Home/out_Standing_student.dart';
import 'package:project_management_app/screens/Home/projects_contaner.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<List<ProjectModel>> _allProjectsFuture;
  final ApiNetworking apiNetworking = ApiNetworking();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
              child:
                  CircularProgressIndicator()); // عرض مؤشر التحميل عند انتظار البيانات
        } else if (snapshot.hasError) {
          return Center(
              child: Text('Error: ${snapshot.error}')); // عرض رسالة الخطأ
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
              child: Text(
                  'No projects available.')); // عرض رسالة عند عدم وجود بيانات
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final project = snapshot.data![index];
            return Projects(
              projectName: project.projectName ?? 'Untitled Project',
              bootcampName: project.bootcampName ?? 'Unknown Bootcamp',
              type: project.type ?? 'Unknown',
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Search Bar Section
                  Padding(
                    padding: EdgeInsets.all(4.w),
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
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                prefixIcon: const Icon(Icons.search),
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
                  SizedBox(height: 3.h),

                  const Center(child: ImageSlider()), // Image Slider
                  SizedBox(height: 2.h),

                  // Tab Bar Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      dividerHeight: 0,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.purple,
                      tabs: [
                        _buildTab("All", context),
                        _buildTab("Recent", context),
                        _buildTab("Top", context),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),

                  // TabBarView Section
                  SizedBox(
                    height: 80.h,
                    child: TabBarView(
                      controller: _tabController,
                      clipBehavior: Clip.none,
                      children: [
                        _buildProjectsTab(_allProjectsFuture),
                        const Center(child: Text('Content 2')),
                        const Center(child: Text('Content 3')),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 5,
                    thickness: 7,
                    color: Color.fromARGB(255, 232, 225, 225),
                  ),
                  SizedBox(height: 4.h),

                  // New Programs Section
                  const Botcamps(),
                  SizedBox(height: 2.h),

                  const Divider(
                    height: 5,
                    thickness: 7,
                    color: Color.fromARGB(255, 232, 225, 225),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Outstanding students ..',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 18.sp, // استخدم sp لحجم النص
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),

                  const Out_Standing_Student(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTab(String label, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 1.h,
        horizontal: 5.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.sp, // حجم النص مع تجاوب
        ),
      ),
    );
  }
}
