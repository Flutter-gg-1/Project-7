import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
   File? image;
  ProjectBloc() : super(ProjectInitial()) {
    on<ProjectEvent>((event, emit) {});

    on<ImageChangeEvent>((event, emit) {
      emit(SuccessImageChangeState(selectedImage: image!));
    });
  }
}
