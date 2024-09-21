import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_judge/models/project_model.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_project_event.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectLoading()) {
    on<LoadProjectsEvent>(loadProjects);
  }

  Future<void> loadProjects(
      LoadProjectsEvent event, Emitter<ProjectState> emit) async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/projects.json');
      List<dynamic> jsonData = jsonDecode(response) as List<dynamic>;

      List<ProjectsModel> projects =
          jsonData.map((e) => ProjectsModel.fromJson(e)).toList();

      emit(ProjectLoaded(projects));
    } catch (e) {
      emit(ProjectError("Failed to load projects: ${e.toString()}"));
    }
  }
}
