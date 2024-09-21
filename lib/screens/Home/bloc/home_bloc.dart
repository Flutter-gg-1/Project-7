import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_management_app/models/project_model.dart';
import 'package:project_management_app/networking/api_networking.dart';

part 'home_event.dart';
part 'home_state.dart';
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiNetworking apiNetworking;

  HomeBloc({required this.apiNetworking}) : super(HomeInitial()) {
    on<FetchProjects>(_onFetchProjects);
  }

  Future<void> _onFetchProjects(
    FetchProjects event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoading());
      final projects = await apiNetworking.getAllPublicProjects();
      emit(HomeLoaded(projects));
    } catch (error) {
      emit(HomeError(error.toString()));
    }
  }
}
