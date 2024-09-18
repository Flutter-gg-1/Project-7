import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tuwaiq_project/networking/mixin/project_mix.dart';
import 'package:tuwaiq_project/networking/networking_api.dart';

part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  final api = NetworkingApi();
  File? logoImage;
  File? projectImage;
  File? presentation;
  List<int>? presentationAsList;
  String ammarToken =
      'NjliNDlmMTE3N2M1MTZmNDcwZDAzMzliNzVmMGZjNjExNzhmZjJmMzg1NjRkYjkyZTA5NzY3ZmM3ODE4MDNiZTE0YTM2NzYyYmNkOThmN2ExMjIxYjRlYTc3OGJiNjc0N2RhZjc1ODRhOTM2NjNlZTM3MGEwYjAxYzYxN2MwNThiZThlZjRmZGQ4M2EwMDRhY2FhNmU2NTM1OGY1ZTNiODk4OWQ4NmMzYTRmMmU1YzQ2NWY1YjFmMDUxZWY4ZTEwMzkxNmE2OWFmNDkzOTlmMjA5ZGNmYjk4YzViZTAxZjcxZWU5NGQ0ZTNiMjdmNmRkZWQ2NTQwZjgxMGZlZTQ3Mjk3ODAzZjliNDNjNTgzNTU2OGIzMDliYzM5YTJkNDRmZGU5MTliYTQyMzAzOGU4ZTQ5NTJlYWQ3NTEzYTRmMmUzOGYzZjZkMGVlN2NiYzhhZGVhNzRmZDEzNzdiMDE4NjU1ZjgyYWIyNGMwZWEyZWNjZDdlMGU3NmEzYTBlNWI4NWUwZTExYTU1NTQzNDIzMzlhNzA3NmUzZTUzOWNmY2M4NDdjMWM3YTVjNTQ2OGY1MWQ4YjkzNTA0ZTUxYWE5NWQ0ZWE5YjM1Y2IyMGI0MjY1NzBlMDM1MGIzZmI5MGEzOWQ2OWUzYzRmY2Q1ZTg1OWEzNDcwNjZjN2RiMDZlZjNmMzdhNmJmNTM4YzA5OTI1NjhlMzhkNDdjYjA1NjQxMThmZmYwZjhlNDg3Mzc4ZmZkNzNhYTZlYTgzMGE1OThiZDAzYzU4ODQzNzI3MDlmYjdiNDBlZjc2OTk4ZjUyNTVmOTlhZDVhZmRiYjdmYTVhODM4N2RmZTBlNGEwYTc1YjhjODE1MmUwMGRmMTY0MjI4OTM2OGMzZDViNWE0MzYyMDE5ODI1ODZlZDc2YjdkYTQ5YjhlMWVjMWI4Mzk3ODEwM2QyZjIzZTE2Mzg2ZWIyNGFkMTRkNWZjYTM1NGQ3OGEyZjJkYzkyOWQwNTUyNzA4YjMwODU5YzVmYmFlZjlkMDAxODVhZDBmMmI0NmJlZmM1MzAwY2U4MGQxZmU0Y2M3NWI0OGIzY2Y1NWU4MjNiODA1NzY3ODA0MWQ3MWFiY2M2M2M4MDY1YWVhYTk4MzRlZTU0YjIxYWE5ZmMwNDc4YzI2N2FmYTBkOGM5ZTA2ZjY1NWJiYzA2MzJhYWEzMWU1YzFjMzI4MmQwNDk5NjZjNmZhNWE0Y2ZmY2NjZWJhOWJiZmRhNDIwNDZkNzAwMDVhZDU2Mjg2ZGIzMTcxNGIwYTUwZTE5Zjg2YTRiODc3ZTQzNGU2ZTc4MzJlOTUxYTk3NDQwNDQyZDYzODA3OWYwNDk5ZDRjMTc1YzgyMTU3ZmIzNTkyYzlmZGI0OTFjNGE5YTQ0ZDI3ODdjYTEyYzI0MmE0ZDAzMzhjMDQ1MWNmMjVmZDg4Y2Q5MWJhMjczODY5NTBlMGU2NmMyMDk5NTg3MGE2MTI3OWJiM2JiYTJlNDRmZmRmNmEzNjNlZjhiNGJiMWY3OWY5YjQ0MjA2YjRhOGEzYjY5ODAwNmVhM2UwZDFhMmM2ODYzMzRhZTg3ZmE2Y2NmMzFlN2I2YmE1YTExNjdmZTQ5MTcwM2M5MTc0MWIxMzE2YTA5NmY5MWY5ZjU4OTA4MzYyNGVmYmE3OTBlZWM1NmMzMjU5ZjllOTdkM2VmOGYyMTYwYzVhZmExYmVkN2I0NTk1NjZiMjI2OWEzYjNmMzM1YzdkYjNhY2RlMzVhZTMxZTkwMjI5MzVmYTc1NTZmYTRmNDEzZmZlOGVjYjZkOWE2ZWFkNzc4M2ViMGE2NjcyOTdlNWQ3NzQ1ZjExMTMzMzU5Zjg1OTdkYWQ3YTRhZjFkNzkyOTJiYzVjZWEzZTFhMWQ5MWRmODMzNzQyMzFjNzA4NGU5NWIzNzU0MzRlZmYxNWFjMDA0OTE5YWJmOWZkNTdkMjMxOGFhYTdiNGMyZjYwMTRiOTc5NDc3ZjVkNWE2MDdkZGUzMTFlMzJlYTI0ZjA4MWJhM2NiNDY1NDAxZWI2MzBhMmU4NzZjYjIzZGNjNzFlMWU1YWRkYjZlZTNkNDhjYTZkZGFkNzZkYWI1N2I0MDI2NmU0ZDNlNGMwMTQ5ZjJjYWE3ZjkyMTc0MjdiZjc0MDFlZjk1ZjQ2NGUzMjk4NjNhYzdiNDM5Y2MzYzkxNGRjMTg5NjQ4ZWQ3OTA5MDIxNGEwYzEx';
  //====base controller========
  TextEditingController projectNameController =
      TextEditingController(text: 'test');
  TextEditingController bootcampNameController =
      TextEditingController(text: 'Flutter Bootcamp');
  TextEditingController typeController = TextEditingController(text: 'app');
  TextEditingController startDateController =
      TextEditingController(text: '01/01/2024');
  TextEditingController endDateController =
      TextEditingController(text: '31/12/2024');
  TextEditingController presentationDateController =
      TextEditingController(text: '30/09/2024');
  TextEditingController projectDescriptionController = TextEditingController(
      text: 'This is a sample project description for testing purposes.');
  //==========================

  //=====Links Controller=============
  TextEditingController githubController =
      TextEditingController(text: 'https://github.com/example');
  TextEditingController figmaController =
      TextEditingController(text: 'https://figma.com/example');
  TextEditingController videoController =
      TextEditingController(text: 'https://youtube.com/example');
  TextEditingController pinterestController =
      TextEditingController(text: 'https://pinterest.com/example');
  TextEditingController playstoreController = TextEditingController(
      text: 'https://play.google.com/store/apps/details?id=example');
  TextEditingController applestoreController =
      TextEditingController(text: 'https://apps.apple.com/app/idexample');
  TextEditingController apkController =
      TextEditingController(text: 'https://example.com/app.apk');
  TextEditingController weblinkController =
      TextEditingController(text: 'https://example.com');
//=====================
  EditBloc() : super(EditInitial()) {
    on<EditEvent>((event, emit) async {});
    on<ChangeLinksEvent>((event, emit) async {
      try {
        final res = await api.chnageLinks(
            token: ammarToken,
            links: generateLinksList(),
            projectId: 'p-ipotpvpI9H');
        emit(SucsessState(msg: res.toString()));
      } on DioException catch (error) {
        emit(ErrorState(msg: '${error.message}'));
      } catch (e) {
        emit(ErrorState(msg: '$e'));
      }
    });
    on<ChangePresentationEvent>(changePresentationMethod);

    on<ChangeBaseEvent>(changeBaseMethod);
    on<ChangeLogoEvent>(changeLogoMethod);

    //file picker event
    on<FilePickedEvent>((event, emit) async {
      presentation = event.selectedFile;
      Uint8List fileAsList = await presentation!.readAsBytes();
      presentationAsList = fileAsList.toList();
      emit(ProjectImagesState(presentationFile: presentation));
    });
    //image picker event
    on<LogoImageChangeEvent>((event, emit) async {
      logoImage = event.selectedImage;
      emit(ProjectImagesState(
        logoImage: logoImage,
        projectImage: projectImage,
      ));
    });

    on<ProjectImageChangeEvent>((event, emit) {
      projectImage = event.selectedImage;
      emit(ProjectImagesState(
        logoImage: logoImage,
        projectImage: projectImage,
      ));
    });
  }

  FutureOr<void> changePresentationMethod(event, emit) async {
    try {
      final res = await api.chnagePresentation(
          token: ammarToken,
          presentationFile: presentationAsList!,
          projectId: 'p-ipotpvpI9H');
      emit(SucsessState(msg: res.toString()));
    } on DioException catch (error) {
      emit(ErrorState(msg: '${error.message}'));
    } catch (e) {
      emit(ErrorState(msg: '$e'));
    }
  }

  FutureOr<void> changeBaseMethod(event, emit) async {
    try {
      final res = await api.chnageBaseData(
          token: ammarToken,
          projectId: 'p-ipotpvpI9H',
          projectName: projectNameController.text.trim(),
          bootcampName: bootcampNameController.text.trim(),
          type: typeController.text.trim(),
          startDate: startDateController.text.trim(),
          endDate: endDateController.text.trim(),
          presentationDate: presentationDateController.text.trim(),
          projectDescription: projectDescriptionController.text.trim());
      emit(SucsessState(msg: res.toString()));
    } on DioException catch (error) {
      emit(ErrorState(msg: '${error.message}'));
    } catch (e) {
      emit(ErrorState(msg: '$e'));
    }
  }

  FutureOr<void> changeLogoMethod(event, emit) async {
    try {
      Uint8List imageAsList = await logoImage!.readAsBytes();
      await api.chnagelogo(
          token: ammarToken,
          logoImg: imageAsList.toList(growable: false),
          projectId: 'p-ipotpvpI9H');
      print(logoImage!.path);
      emit(SucsessState(msg: 'Project logo change sucsessfully'));
      logoImage = null;
    } on DioException catch (error) {
      emit(ErrorState(msg: '${error.message}'));
    } catch (e) {
      emit(ErrorState(msg: '$e'));
    }
  }

  List<Map<String, String?>> generateLinksList() {
    List<Map<String, String?>> links = [];

    if (githubController.text.isNotEmpty) {
      links.add({"type": "github", "url": githubController.text});
    }
    if (figmaController.text.isNotEmpty) {
      links.add({"type": "figma", "url": figmaController.text});
    }
    if (videoController.text.isNotEmpty) {
      links.add({"type": "video", "url": videoController.text});
    }
    if (pinterestController.text.isNotEmpty) {
      links.add({"type": "pinterest", "url": pinterestController.text});
    }
    if (playstoreController.text.isNotEmpty) {
      links.add({"type": "playstore", "url": playstoreController.text});
    }
    if (applestoreController.text.isNotEmpty) {
      links.add({"type": "applestore", "url": applestoreController.text});
    }
    if (apkController.text.isNotEmpty) {
      links.add({"type": "apk", "url": apkController.text});
    }
    if (weblinkController.text.isNotEmpty) {
      links.add({"type": "weblink", "url": weblinkController.text});
    }

    return links;
  }
}
