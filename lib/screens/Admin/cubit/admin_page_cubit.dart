import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_management_app/models/project_model.dart';
import 'package:project_management_app/networking/api_networking.dart';

part 'admin_page_state.dart';

class AdminPageCubit extends Cubit<AdminPageState> {
  final ApiNetworking apiNetworking;

  AdminPageCubit({required this.apiNetworking}) : super(AdminPageInitial());

  Future<void> fetchProjects() async {
    emit(AdminPageLoading());
    try {
      final List<ProjectModel> projects =
          await apiNetworking.getAllPublicProjects();
      emit(AdminPageLoaded(projects: projects));
    } catch (e) {
      emit(const AdminPageError(message: 'Failed to load projects'));
    }
  }
}
