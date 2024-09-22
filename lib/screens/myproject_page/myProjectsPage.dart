import 'package:flutter/material.dart';
import 'package:project_judge/components/tab_bar/Closed_tab_bar.dart';
import 'package:project_judge/components/tab_bar/Opened_tab_bar.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/screens/add_project_screen/add_project_screen.dart';
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
  Widget build(BuildContext context) {
    final currentProject = getIt.get<DataLayer>().projectInfo;
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
              itemCount: 6,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: MyProjectCardOpened(project: currentProject![0],),
                );
              }),
          ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: MyProjectCardClosed(project: currentProject![0],),
                );
              }),
        ],
      ),
      floatingActionButton: getIt.get<DataLayer>().userInfo?.role != "user"
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddProjectScreen()));
              },
              backgroundColor: Colors.cyan,
              shape: const CircleBorder(),
              heroTag: 'unique_tag',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
