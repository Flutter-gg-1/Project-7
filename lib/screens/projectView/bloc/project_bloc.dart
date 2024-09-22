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
            token:
                'OGQxOTYwZTI1OWRjYTA0ZTA2YWU1NGU0ZTI4NWI4ODEwYjk1YjA4ZmUzNjA2MGEyZTdlOGRlNWU3MzlkY2YwMTAyNmQwZTUzOWU5OTkwOWZiYWQ0NWFhNDA0ODk0MWI5YTIzOWExYzc4ZmM5MjQ4ZjkxN2Y3ZTg1Y2Q1OWVmMDNhZGQxZjYyNTY4MGMzOWUzNjFlZjlkYzA0MWU3ZjFjOTI1YWRiNmJjYTVjMWJhNjE2MmQwMGZkYjUyZjhkMWYyM2Y4ZDJiZmJhODZjZjM4YTU4MzQ3ODdhNDM4ZTRjOTI4NTVjMTdiZTAwOTY3YjZmNDdmM2FmNzk2NzFiZWMxNjRlMzM1MjViZjIxZmZjZTcxYjQ0ZjI5YTJiY2M4ODVmYWNlNTQ3YmE0YTczNDk3Mjg5OWUzMDliYzNkYzhkNTQ3OGY2YWI5MmY0NmE4OWJjZDlkMGM4NDUyNTM0OTJlZWNkNGM5YWNkNGNiYTBiYjM2YjhiOGQxODY1OTgxNzRiYTFkNGVjMDkyMTg3YTM0Yzg2Mjg1N2NkYjNhZjQ2OTBmNmFkNGJlN2NiZDNmMmM1YjI4MDVhYTkyZDQ4OTNlOTdlZTJiMTJmNjVmYTdiNGU5Yjg3MGE5MGFmMDZjN2NjYmI4NTMxZTMzYzZlZWQzZjE1MTc5YzBlZTJlOWVhZjc5YWI3YTFiNjNmNWQ2NGFkYWQxNmI1MDU0ODgzNTcyODc0ZTFkNzViMGUyZTM5YTliYzcxNjM3NzJlMzM2MDBkODZiMGY4ODZmNGFiNTY3M2U4NjEwZDM1Y2FiZjNjODA3ZTBkYWJhM2IwOWI4MGMyYjIzYTA2NTdmNjQzODEzYTU1ZjFhOGUzODNkMmE5ZDdkYjRhOWZkNDA5NTM5YjU2MThhM2MyZThhZWYwYzA1ZjE3NDVjNjEwMjI5NTdmNTUwNDIxMDdlMzU0ZmQ3NDA5ZWY3OTNlOTk0NzhjMzIwNDkyZGY1MTg3OWE5N2M2YTg1NjhiMjY3OTQ0MGI0YjFiMDFiNGI4NDJkYzJjNjQyZjc5N2FhZDI5NWQyMWU5ODBlMTc3ZDI3NzhiYjkxYjE0MDExZTk2ZDg1Yjc2ZDUwZGQwZGY3MjM2N2NhNWU5MGIzNDRiYzJmNzk3NzU0YWU3Y2FlYjcxOGMxYTNmYTdkODE4MTg1ZjY4YTI4NTA0MmI1M2UzZjNiNzNjMmY0MTlmZmQyZjhmYTQwODA4MmY3ODQyODA5ZjhiNTk0ZmI0NTY2NzliMjZmNjQ5N2Q2ZjUzNjViZmIwN2EwZTY2MmJlYzJmNmE4MmNlNjY4ZDEzNWYxMjExZjAwNTFiZDczZjdhNGE1YTY4MzBmZTNlYmZkZGNhNGQ0MjRmNTlkNjhhYzExYzkwZmQxMTc5Y2EzNTYzZmY0MDY0MTZhYjRmNWJkODM2ZDU0MjgyZGZjMDQ1NTA1MmQ4MmEwM2JjN2IxYTQzZWI4MmJhYmIyNWRkYThiY2EyNTA5ZTUwNDdhOTg1YWQ2MzMwYjQ2NzExOWUwYmQwNjI2NThkMTNhZTNkYWYyZjNjMDE4YTI3YTY2NWU1NDAyZjI3ZWZmNDdjZDA1MzgwOGFjZjc0ZmJkODExM2ZiNTlkZDVlYWIxZDA1NTRiNDcxMWE3MTQ5ODA0N2M2Y2I3YTA4ZWE2Yzk0OThmZjIwYjdkZGYyNTU1NDI2ZmRlZmMwZWVjMzQyMzk2NjkwMjFjNzAzMDM3NWQ1N2QxNTI3MWYxZGRmZjAyNDM1Mjk4MGIzMDU2YmRiMTEyY2U1Njk4M2IyY2IwYjU1NjZmZjU3NzlkNjBkZmJiZDdlMWZmYTNiMmU0ZWU1NzAyOGJjZjdmYmEwZWM4YzhmM2JiZWYyZWI5YzYwN2NhNzFjOTUzZWVkMGYzY2RlNzkzY2MzY2U5ZjU2ZTM2OWQzYWNiNTdjNDI5YmViYjM0ZWFlYjI3MWU2YmQyYmU5ODkxYjBhYzUwOTBlNWJiZmZlZDUxNDNiNzJlYTE1NTM4M2Y5M2U1MGExNjcwMTEyZDE0ZjU3ZmZmZmExODlkYjAzYzEwZjk3ZTJkOTUxNzVlNTBiZDE4ODgzNWY0ZjIwMGRlOTYxN2I2YzMzNzk5ODFlNzBmODE2ODNkN2VkODA1Yjc0NjM5ZDYyYjZjOGY5ODA5N2RkMDQ0M2Y1YzNhN2FjY2E0OWVlN2Y1NzI4MDNkMjc5NDExYTVkMWZjODUwMmEwYjQ2Yg==',
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
        await api.delproject(
            token:
                'OGQxOTYwZTI1OWRjYTA0ZTA2YWU1NGU0ZTI4NWI4ODEwYjk1YjA4ZmUzNjA2MGEyZTdlOGRlNWU3MzlkY2YwMTAyNmQwZTUzOWU5OTkwOWZiYWQ0NWFhNDA0ODk0MWI5YTIzOWExYzc4ZmM5MjQ4ZjkxN2Y3ZTg1Y2Q1OWVmMDNhZGQxZjYyNTY4MGMzOWUzNjFlZjlkYzA0MWU3ZjFjOTI1YWRiNmJjYTVjMWJhNjE2MmQwMGZkYjUyZjhkMWYyM2Y4ZDJiZmJhODZjZjM4YTU4MzQ3ODdhNDM4ZTRjOTI4NTVjMTdiZTAwOTY3YjZmNDdmM2FmNzk2NzFiZWMxNjRlMzM1MjViZjIxZmZjZTcxYjQ0ZjI5YTJiY2M4ODVmYWNlNTQ3YmE0YTczNDk3Mjg5OWUzMDliYzNkYzhkNTQ3OGY2YWI5MmY0NmE4OWJjZDlkMGM4NDUyNTM0OTJlZWNkNGM5YWNkNGNiYTBiYjM2YjhiOGQxODY1OTgxNzRiYTFkNGVjMDkyMTg3YTM0Yzg2Mjg1N2NkYjNhZjQ2OTBmNmFkNGJlN2NiZDNmMmM1YjI4MDVhYTkyZDQ4OTNlOTdlZTJiMTJmNjVmYTdiNGU5Yjg3MGE5MGFmMDZjN2NjYmI4NTMxZTMzYzZlZWQzZjE1MTc5YzBlZTJlOWVhZjc5YWI3YTFiNjNmNWQ2NGFkYWQxNmI1MDU0ODgzNTcyODc0ZTFkNzViMGUyZTM5YTliYzcxNjM3NzJlMzM2MDBkODZiMGY4ODZmNGFiNTY3M2U4NjEwZDM1Y2FiZjNjODA3ZTBkYWJhM2IwOWI4MGMyYjIzYTA2NTdmNjQzODEzYTU1ZjFhOGUzODNkMmE5ZDdkYjRhOWZkNDA5NTM5YjU2MThhM2MyZThhZWYwYzA1ZjE3NDVjNjEwMjI5NTdmNTUwNDIxMDdlMzU0ZmQ3NDA5ZWY3OTNlOTk0NzhjMzIwNDkyZGY1MTg3OWE5N2M2YTg1NjhiMjY3OTQ0MGI0YjFiMDFiNGI4NDJkYzJjNjQyZjc5N2FhZDI5NWQyMWU5ODBlMTc3ZDI3NzhiYjkxYjE0MDExZTk2ZDg1Yjc2ZDUwZGQwZGY3MjM2N2NhNWU5MGIzNDRiYzJmNzk3NzU0YWU3Y2FlYjcxOGMxYTNmYTdkODE4MTg1ZjY4YTI4NTA0MmI1M2UzZjNiNzNjMmY0MTlmZmQyZjhmYTQwODA4MmY3ODQyODA5ZjhiNTk0ZmI0NTY2NzliMjZmNjQ5N2Q2ZjUzNjViZmIwN2EwZTY2MmJlYzJmNmE4MmNlNjY4ZDEzNWYxMjExZjAwNTFiZDczZjdhNGE1YTY4MzBmZTNlYmZkZGNhNGQ0MjRmNTlkNjhhYzExYzkwZmQxMTc5Y2EzNTYzZmY0MDY0MTZhYjRmNWJkODM2ZDU0MjgyZGZjMDQ1NTA1MmQ4MmEwM2JjN2IxYTQzZWI4MmJhYmIyNWRkYThiY2EyNTA5ZTUwNDdhOTg1YWQ2MzMwYjQ2NzExOWUwYmQwNjI2NThkMTNhZTNkYWYyZjNjMDE4YTI3YTY2NWU1NDAyZjI3ZWZmNDdjZDA1MzgwOGFjZjc0ZmJkODExM2ZiNTlkZDVlYWIxZDA1NTRiNDcxMWE3MTQ5ODA0N2M2Y2I3YTA4ZWE2Yzk0OThmZjIwYjdkZGYyNTU1NDI2ZmRlZmMwZWVjMzQyMzk2NjkwMjFjNzAzMDM3NWQ1N2QxNTI3MWYxZGRmZjAyNDM1Mjk4MGIzMDU2YmRiMTEyY2U1Njk4M2IyY2IwYjU1NjZmZjU3NzlkNjBkZmJiZDdlMWZmYTNiMmU0ZWU1NzAyOGJjZjdmYmEwZWM4YzhmM2JiZWYyZWI5YzYwN2NhNzFjOTUzZWVkMGYzY2RlNzkzY2MzY2U5ZjU2ZTM2OWQzYWNiNTdjNDI5YmViYjM0ZWFlYjI3MWU2YmQyYmU5ODkxYjBhYzUwOTBlNWJiZmZlZDUxNDNiNzJlYTE1NTM4M2Y5M2U1MGExNjcwMTEyZDE0ZjU3ZmZmZmExODlkYjAzYzEwZjk3ZTJkOTUxNzVlNTBiZDE4ODgzNWY0ZjIwMGRlOTYxN2I2YzMzNzk5ODFlNzBmODE2ODNkN2VkODA1Yjc0NjM5ZDYyYjZjOGY5ODA5N2RkMDQ0M2Y1YzNhN2FjY2E0OWVlN2Y1NzI4MDNkMjc5NDExYTVkMWZjODUwMmEwYjQ2Yg==',
            projectId: projectIdController.text.trim());

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
      emit(EditChangeState(isEdit: isEdit));
    });
  }
}
