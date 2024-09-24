part of 'project_info_cubit.dart';

@immutable
sealed class ProjectInfoState {}

final class ProjectInfoInitial extends ProjectInfoState {}

final class ImgChangeState extends ProjectInfoState {
  final int imgIndex;

  ImgChangeState({required this.imgIndex});
}

final class PageUpdateState extends ProjectInfoState {
  final ProjectsModel projectsModel;

  PageUpdateState({required this.projectsModel});
}

final class LodingState extends ProjectInfoState {}
