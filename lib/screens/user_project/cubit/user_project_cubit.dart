import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tuwaiq_project/models/profile_model.dart';
import 'package:tuwaiq_project/models/projects_model.dart';
import 'package:tuwaiq_project/networking/networking_api.dart';

part 'user_project_state.dart';

class UserProjectCubit extends Cubit<UserProjectState> {
  List<ProjectsModel> projectList = [];
  UserProjectCubit() : super(UserProjectInitial());

  showProjectUser() async {
    try {
      emit(UserProjectSLoadingState());

      ProfileModel pro = await NetworkingApi().profileGet();
      if (pro.projects.isEmpty) {
        emit(UserProjectInitial());
        return;
      }
      projectList = pro.projects;
      emit(UserProjectShowState(projectList: projectList));
    } catch (err) {
      emit(UserProjectErrState(msg: err.toString()));
    }
  }
}
