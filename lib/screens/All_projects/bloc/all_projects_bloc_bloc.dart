import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_management_app/models/project_model.dart';
import 'package:project_management_app/networking/api_networking.dart';

part 'all_projects_bloc_event.dart';
part 'all_projects_bloc_state.dart';

class AllProjectsBloc extends Bloc<AllProjectsEvent, AllProjectsState> {
  final ApiNetworking apiNetworking;

  AllProjectsBloc(this.apiNetworking) : super(AllProjectsInitial()) {
    on<FetchAllProjectsEvent>((event, emit) async {
      emit(AllProjectsLoading());
      try {
        final projects = await apiNetworking.getAllPublicProjects();
        emit(AllProjectsLoaded(projects));
      } catch (e) {
        emit(AllProjectsError(e.toString()));
      }
    });
  }
}