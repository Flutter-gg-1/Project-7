import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tuwaiq_project/networking/networking_api.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final api = NetworkingApi();
  File? profileImage;
  File? logoImage;
  File? projectImage;
  File? presentationImage;
  TextEditingController userIdController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController projectIdController = TextEditingController();
  bool isEdit = true;
  bool isPublic = true;
  bool allowRating = true;
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
    on<CreateProjectEvent>((event, emit) async {
      try {
        await api.createProject(
            userId: userIdController.text.trim(),
            timeEditEnd: endDateController.text.trim(),
            isEdit: isEdit);

        emit(SucsessState(msg: 'Project create sucsessfuly'));
        userIdController.clear();
        endDateController.clear();
      } on DioException catch (error) {
        emit(ErrorState(msg: '${error.message}'));
      } catch (e) {
        emit(ErrorState(msg: '$e'));
      }
    });
    on<DeleteProjectEvent>((event, emit) async {
      try {
        await api.delproject(projectId: projectIdController.text.trim());

        emit(SucsessState(msg: 'Project delete sucsessfuly'));
        projectIdController.clear();
      } on DioException catch (error) {
        emit(ErrorState(msg: '${error.message}'));
      } catch (e) {
        emit(ErrorState(msg: '$e'));
      }
    });
    on<IsEditEvent>((event, emit) {
      isEdit = event.isEdit;
      emit(EditStatusState(isEdit: isEdit));
    });
  }
}
