import 'package:flutter/material.dart';
import 'package:project_judge/components/tab_bar/Closed_tab_bar.dart';
import 'package:project_judge/components/tab_bar/Opened_tab_bar.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/models/user_model.dart';
import 'package:project_judge/setup/init_setup.dart';

class MyProjectsScreen extends StatefulWidget {
  const MyProjectsScreen({super.key});

  @override
  MyProjectsScreenState createState() => MyProjectsScreenState();
}

class MyProjectsScreenState extends State<MyProjectsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  // List<Projects> openProjects = [];
  // List<Projects> closedProjects = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  UserModel user = getIt.get<DataLayer>().userInfo!; // Get user info
  late List<Projects> openProjects =
      user.projects!.where((project) => project.allowEdit!).toList();
  late List<Projects> closedProjects =
      user.projects!.where((project) => !project.allowEdit!).toList();

  Future<void> loadProjects() async {
    // Assume you have a method to get user info that includes projects
    UserModel user = getIt.get<DataLayer>().userInfo!; // Get user info
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF4E2EB5),
        appBar: AppBar(
          backgroundColor: const Color(0xFF4E2EB5),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'My Projects',
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            indicatorWeight: 8.0,
            indicatorSize: TabBarIndicatorSize.tab,
            controller: tabController,
            indicatorColor: Colors.cyan,
            labelColor: Colors.cyan,
            labelStyle: const TextStyle(
              fontSize: 20,
              color: Colors.cyan,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 20,
            ),
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Open'),
              Tab(text: 'Closed'),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            ListView.builder(
              itemCount: openProjects.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: MyProjectCardOpened(
                      project: openProjects[index]), // Pass project data
                );
              },
            ),
            ListView.builder(
              itemCount: closedProjects.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: MyProjectCardOpened(
                      project: openProjects[index]), // Pass project data
                );
              },
            ),
          ],
        ),
        floatingActionButton: user.role == 'user'
            ? FloatingActionButton(
                onPressed: () {
                  //  Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => Add(), ));
                },
                backgroundColor: Colors.cyan,
                shape: const CircleBorder(),
                heroTag: 'unique_tag',
                child: const Icon(Icons.add),
              )
            : null);
  }
}
