import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project_judge/components/project_card/projectCard.dart';
import 'package:project_judge/components/tab_bar/tab_bar_browse.dart';
import 'package:project_judge/components/text_field/custom_text_form_field.dart';
import 'package:project_judge/models/project_model.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_project_bloc.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_project_event.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_project_state.dart';
import 'package:project_judge/screens/rating/ratingPage.dart';

class BrowsePage extends StatefulWidget {
  @override
  BrowsePageState createState() => BrowsePageState();
}

class BrowsePageState extends State<BrowsePage>
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
    return Scaffold(
      backgroundColor: const Color(0xFF4E2EB5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4E2EB5),
        title: const Text("Browse", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextFormField(
                hintText: 'search',
                icon: Icons.search,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: TabBarWidget(tabController: tabController),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          buildBlocContent(),
          buildBlocContent(),
          buildBlocContent(),
          buildBlocContent(),
        ],
      ),
    );
  }

  Widget buildBlocContent() {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        if (state is ProjectLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProjectLoaded) {
          return buildListView(state.projects);
        } else if (state is ProjectError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text('No projects available.'));
      },
    );
  }

  Widget buildListView(List<ProjectsModel> projects) {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RatingPage()),
            );
          },
          child: ProjectCard(project: projects[index]),
        );
      },
    );
  }
}
