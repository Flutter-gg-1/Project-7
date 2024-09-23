import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_judge/components/tab_bar/Opened_tab_bar.dart';
import 'package:project_judge/components/text_field/custom_text_form_field.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/screens/search_screen/cubit/search_cubit.dart';
import 'package:project_judge/setup/init_setup.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchCubit _searchCubit;

  @override
  void initState() {
    super.initState();
    _searchCubit = SearchCubit();
    loadProjects();
  }

  void loadProjects() {
    final projectData = getIt.get<DataLayer>().projectInfo;
    if (projectData != null) {
      _searchCubit.loadProjects(projectData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _searchCubit,
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Column(
            children: [
              CustomTextFormField(
                onChange: (query) {
                  _searchCubit.filterProjects(query);
                },
                hintText: "What projects are you interested in?",
              ),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchInitial>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.filteredProjects.length,
                      itemBuilder: (context, index) {
                        final project = state.filteredProjects[index];
                        return MyProjectCardOpened(
                          project: project,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchCubit.close(); // Close the cubit when the widget is disposed
    super.dispose();
  }
}
