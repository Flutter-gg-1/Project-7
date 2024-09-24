import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tuwaiq_project/models/projects_model.dart';


part 'project_info_state.dart';

class ProjectInfoCubit extends Cubit<ProjectInfoState> {
  ProjectInfoCubit() : super(ProjectInfoInitial());

  onImgChange({required int imgIndex}) {
    emit(ImgChangeState(imgIndex: imgIndex));
  }

  
}
