import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:project_management_app/models/member_model.dart';
import 'package:project_management_app/models/project_link.dart';
import 'package:project_management_app/models/project_model.dart';
import 'package:project_management_app/networking/api_networking.dart';

part 'edit_project_event.dart';
part 'edit_project_state.dart';

class EditProjectBloc extends Bloc<EditProjectEvent, EditProjectState> {
  final ApiNetworking api;
  final String token;
  final String projectId;

  EditProjectBloc(
      {required this.api, required this.token, required this.projectId})
      : super(EditProjectInitial()) {
    on<LoadProjectData>((event, emit) {
    });

    on<UpdateProjectStatus>((event, emit) async {
      emit(EditProjectLoading());
      try {
        await api.changeProjectStatus(
            token: token,
            projectId: projectId,
            timeEndEdit: event.endTime,
            isEditable: event.isEditable,
            isPublic: event.isPublic);
        emit(ProjectStatusUpdated());
      } catch (e) {
        emit(EditProjectFailure('Failed to update project status'));
      }
    });

    on<SaveBasicInfo>((event, emit) async {
      log('started');
      emit(EditProjectLoading());
      try {
        log('Entered try');
        await api.editProjectInfo(
          projectId: projectId,
          projectName: event.projectName,
          bootcampName: event.bootcampName,
          type: event.projectType,
          startDate: event.startDate,
          endDate: event.endDate,
          presentationDate: event.presentationDate,
          projectDescription: event.projectDescription,
          token: token,
        );
        log('passed');
        emit(BasicInfoSaved());
        log('passed emit');
      } catch (e) {
        log('Failed');
        emit(EditProjectFailure('Failed to save basic info'));
      }
    });

    on<SaveProjectLinks>((event, emit) async {
      emit(EditProjectLoading());
      try {
        List<ProjectLink> links = [
          ProjectLink(type: "github", url: event.githubLink),
          ProjectLink(type: "figma", url: event.figmaLink),
          ProjectLink(type: "video", url: event.videoLink),
          ProjectLink(type: "pinterest", url: event.pinterestLink),
          ProjectLink(type: "playstore", url: event.playStoreLink),
          ProjectLink(type: "applestore", url: event.appleStoreLink),
          ProjectLink(type: "apk", url: event.apkLink),
          ProjectLink(type: "weblink", url: event.webLink),
        ];
        await api.editProjectLinks(
            projectId: projectId, links: links, token: token);
        emit(LinksSaved());
      } catch (e) {
        emit(EditProjectFailure('Failed to save links'));
      }
    });

    on<SaveMembers>((event, emit) async {
      emit(EditProjectLoading());
      try {
        await api.editProjectMembers(
          projectId: projectId,
          members: event.members,
          token: token,
        );
        emit(MembersSaved());
      } catch (e) {
        emit(EditProjectFailure('Failed to save members'));
      }
    });

    on<UploadLogo>((event, emit) async {
      emit(EditProjectLoading());
      try {
        Uint8List data = await event.logo.readAsBytes();
        await api.editProjectLogo(
            projectId: projectId, logo: data.toList(), token: token);
        emit(LogoUploaded());
      } catch (e) {
        emit(EditProjectFailure('Failed to upload logo'));
      }
    });

    on<UploadPresentation>((event, emit) async {
      emit(EditProjectLoading());
      try {
        Uint8List data = await event.presentation.readAsBytes();
        await api.editPresentation(
            projectId: projectId,
            presentationFile: data.toList(),
            token: token);
        emit(PresentationUploaded());
      } catch (e) {
        emit(EditProjectFailure('Failed to upload presentation'));
      }
    });

    on<UploadImages>((event, emit) async {
      emit(EditProjectLoading());
      try {
        List<List<int>> imagesData = await Future.wait(
          event.images.map((file) async => (await file.readAsBytes()).toList()),
        );
        await api.editProjectImages(
            projectId: projectId, images: imagesData, token: token);
        emit(ImagesUploaded());
      } catch (e) {
        emit(EditProjectFailure('Failed to upload images'));
      }
    });
  }
}
