import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tuwaiq_project/data_layer/auth_layer.dart';
import 'package:tuwaiq_project/models/profile_model.dart';
import 'package:tuwaiq_project/networking/networking_api.dart';
import 'package:tuwaiq_project/services/setup.dart';

part 'user_project_state.dart';

class UserProjectCubit extends Cubit<UserProjectState> {
  List<ProjectsModel> projectList = [];
  UserProjectCubit() : super(UserProjectInitial());

  showProjectUser() async {
    try {
      emit(UserProjectSLoadingState());
      // change later
      var user = authLocator.get<AuthLayerData>().auth;

      ProfileModel pro = await NetworkingApi().profileGet(token: user!.token!);
      if (pro.projects.isEmpty) {
        emit(UserProjectInitial());
        return;
      }
      projectList = pro.projects;

      emit(UserProjectShowState(projectList: projectList));
    } catch (err) {
      log("in user eorr -_-");
      emit(UserProjectErrState(msg: err.toString()));
    }
  }
}
