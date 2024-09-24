

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:tuwaiq_project/models/projects_model.dart';
import 'package:tuwaiq_project/networking/networking_api.dart';

part 'show_projects_state.dart';

class ShowProjectsCubit extends Cubit<ShowProjectsState> {
  List<ProjectsModel> projectList = [];

  ShowProjectsCubit() : super(ShowProjectsInitial());

  showProhect() async {
    try {
      emit(LodingProjectState());
      projectList = await NetworkingApi().getAllProject();

      emit(ShowAllProjectState(projectList: projectList));
    } catch (err) {
      emit(ErorrProjectState(msg: err.toString()));
    }
  }
}
