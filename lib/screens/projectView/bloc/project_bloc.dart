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
    on<ProjectEvent>((event, emit) {});

    on<ProfileImageChangeEvent>((event, emit) {
      emit(SuccessImageChangeState(selectedImage: profileImage!));
    });
    on<LogoImageChangeEvent>((event, emit) {
      emit(SuccessImageChangeState(selectedImage: logoImage!));
    });
    on<PresentationImageChangeEvent>((event, emit) {
      emit(SuccessImageChangeState(selectedImage: presentationImage!));
    });
    on<ProjectImageChangeEvent>((event, emit) {
      emit(SuccessImageChangeState(selectedImage: projectImage!));
    });

  }
}
