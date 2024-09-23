import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/models/user_model.dart';
import 'package:project_judge/setup/init_setup.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchInitial> {
  SearchCubit() : super(SearchInitial(allProjects: const [],filteredProjects: const []));

  void loadProjects(List<Projects> projects) {
    emit(SearchInitial(filteredProjects: const [], allProjects: projects));
  }
  void filterProjects(String query) {
    final allProjects = getIt.get<DataLayer>().projectInfo;
    final filtered = query.isEmpty
        ? []
        : allProjects!.where((project) => 
            project.projectName?.toLowerCase().contains(query.toLowerCase()) ?? false).toList();
    
    emit(SearchInitial(filteredProjects: filtered.cast<Projects>(), allProjects: allProjects!));
  }
}
