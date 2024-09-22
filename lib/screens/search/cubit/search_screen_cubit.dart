import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tuwaiq_project/data_layer/auth_layer.dart';
import 'package:tuwaiq_project/models/profile_model.dart';
import 'package:tuwaiq_project/models/projects_model.dart';
import 'package:tuwaiq_project/networking/networking_api.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  final language = languageLocaitor.get<LanguageLayer>();
  List<ProjectsModel> projectList = [];
  SearchScreenCubit() : super(SearchScreenInitial());

  serchProject({required String searchTex}) async {
    if (searchTex.isEmpty) {
      emit(SearchScreenInitial());
      return;
    }
    emit(SearchScreenLodingState());

    try {
      projectList = await NetworkingApi().getAllProject();
      final List<ProjectsModel> myProject = [];
      for (var val in projectList) {
        if (val.projectName?.toLowerCase().contains(searchTex.toLowerCase()) ??
            false) {
          myProject.add(val);
        }
      }

      if (myProject.isNotEmpty) {
        emit(SearchScreenShowFoundState(projectsLis: myProject));
      } else {
        emit(SearchScreenNotFoundState());
      }
    } catch (err) {
      emit(SearchScreenErorrState(msg: err.toString()));
    }
  }
}
