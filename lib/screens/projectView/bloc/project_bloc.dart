import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  File? profileImage;
  File? logoImage;
  File? projectImage;
  File? presentationImage;

  ProjectBloc() : super(ProjectInitial()) {
    on<ProfileImageChangeEvent>((event, emit) {
      profileImage = event.selectedImage;
      emit(ProjectImagesState(
        profileImage: profileImage,
        logoImage: logoImage,
        projectImage: projectImage,
        presentationImage: presentationImage,
      ));
    });
    on<LogoImageChangeEvent>((event, emit) {
      logoImage = event.selectedImage;
      emit(ProjectImagesState(
        profileImage: profileImage,
        logoImage: logoImage,
        projectImage: projectImage,
        presentationImage: presentationImage,
      ));
    });
    on<PresentationImageChangeEvent>((event, emit) {
      presentationImage = event.selectedImage;
      emit(ProjectImagesState(
        profileImage: profileImage,
        logoImage: logoImage,
        projectImage: projectImage,
        presentationImage: presentationImage,
      ));
    });
    on<ProjectImageChangeEvent>((event, emit) {
      projectImage = event.selectedImage;
      emit(ProjectImagesState(
        profileImage: profileImage,
        logoImage: logoImage,
        projectImage: projectImage,
        presentationImage: presentationImage,
      ));
    });
  }
}
