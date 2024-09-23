
import 'package:project_judge/models/user_model.dart';

abstract class ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectLoaded extends ProjectState {
  final List<Projects> projects;

  ProjectLoaded(this.projects);
}

class ProjectError extends ProjectState {
  final String message;


  ProjectError(this.message);
}