import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project_judge/components/tab_bar/Closed_tab_bar.dart';
import 'package:project_judge/components/tab_bar/Opened_tab_bar.dart';
import 'package:project_judge/models/user_model.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_project_bloc.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_project_event.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_project_state.dart';

class MyProjectPagee extends StatefulWidget {
  const MyProjectPagee({super.key});

  @override
  MyProjectPageeState createState() => MyProjectPageeState();
}

class MyProjectPageeState extends State<MyProjectPagee>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);

    context.read<ProjectBloc>().add(LoadProjectsEvent());
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectBloc = GetIt.I<ProjectBloc>();

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
      body: BlocBuilder<ProjectBloc, ProjectState>(
        bloc: projectBloc,
        builder: (context, state) {
          if (state is ProjectLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProjectLoaded) {
            final openProjects =
                state.projects.where((p) => p.allowEdit).toList();
            final closedProjects =
                state.projects.where((p) => !p.allowEdit).toList();
            return TabBarView(
              controller: tabController,
              children: [
                buildProjectList(openProjects, true),
                buildProjectList(closedProjects, false),
              ],
            );
          } else if (state is ProjectError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.add),
      ),
    );
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
