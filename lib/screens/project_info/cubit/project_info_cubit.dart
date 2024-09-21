import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'project_info_state.dart';

class ProjectInfoCubit extends Cubit<ProjectInfoState> {
  ProjectInfoCubit() : super(ProjectInfoInitial());

  onImgChange({required int imgIndex}) {


    emit(ImgChangeState(imgIndex: imgIndex));
  }
}
