
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_judge/components/tab_bar/Closed_tab_bar.dart';
import 'package:project_judge/components/tab_bar/Opened_tab_bar.dart';
import 'package:project_judge/models/project_model.dart';
import 'package:project_judge/screens/rating/blocs/bloc_project_bloc.dart';
import 'package:project_judge/screens/rating/blocs/bloc_project_event.dart';
import 'package:project_judge/screens/rating/blocs/bloc_project_state.dart';

class MyProjectsScreen extends StatefulWidget {
  @override
  MyProjectsScreenState createState() => MyProjectsScreenState();
}


class MyProjectsScreenState extends State<MyProjectsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ProjectBloc projectBloc;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    projectBloc = ProjectBloc()
      ..add(LoadProjectsEvent()); 
  }

  @override
  void dispose() {
    tabController.dispose();
    projectBloc.close(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4E2EB5),
      appBar: AppBar(
        backgroundColor: Color(0xFF4E2EB5),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Projects',
          style: TextStyle(color: Colors.white),
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorWeight: 8.0,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.cyan,
          labelColor: Colors.cyan,
          labelStyle: TextStyle(fontSize: 20, color: Colors.cyan),
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'Open'),
            Tab(text: 'Closed'),
          ],
        ),
      ),
      body: BlocBuilder<ProjectBloc, ProjectState>(
        bloc: projectBloc,
        builder: (context, state) {
          if (state is ProjectLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProjectLoaded) {
       
            final openProjects = state.projects.where((p) => p.isOpen).toList();
            final closedProjects =
                state.projects.where((p) => !p.isOpen).toList();
            return TabBarView(
              controller: tabController,
              children: [
                buildProjectList(openProjects, true),
                buildProjectList(closedProjects, false),
              ],
            );
          } else if (state is ProjectError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
        shape: CircleBorder(),
      ),
    );
  }

  Widget buildProjectList(List<Project> projects, bool isOpen) {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: isOpen
              ? MyProjectCardOpened(project: projects[index]) : MyProjectCardClosed(project: projects[index]),
        );
      },
    );
  }
}
