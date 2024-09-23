import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_judge/components/tab_bar/Closed_tab_bar.dart';
import 'package:project_judge/components/tab_bar/Opened_tab_bar.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/models/user_model.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_project_bloc.dart';
import 'package:project_judge/setup/init_setup.dart';

class MyProjectsScreen extends StatefulWidget {
  const MyProjectsScreen({super.key});

  @override
  MyProjectsScreenState createState() => MyProjectsScreenState();
}

class MyProjectsScreenState extends State<MyProjectsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final projectBloc = GetIt.I<ProjectBloc>();
      UserModel user = getIt.get<DataLayer>().userInfo!; // Get user info
      late List<Projects> openProjects =
          user.projects!.where((project) => project.allowEdit).toList();
      late List<Projects> closedProjects =
          user.projects!.where((project) => !project.allowEdit).toList();

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
            controller: tabController,
            indicatorWeight: 8.0,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.cyan,
            labelColor: Colors.cyan,
            labelStyle: const TextStyle(fontSize: 20, color: Colors.cyan),
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Opened'),
              Tab(text: 'Closed'),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            buildProjectList(openProjects, true),
            buildProjectList(closedProjects, false),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.cyan,
          child: const Icon(Icons.add),
        ),
      );
    });
  }

  Widget buildProjectList(List<Projects> projects, bool isOpen) {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: isOpen
              ? MyProjectCardOpened(project: projects[index])
              : MyProjectCardClosed(project: projects[index]),
        );
      },
    );
  }
}
