import 'dart:io';
import 'dart:typed_data';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/models/user_model.dart';
import 'package:project_judge/setup/init_setup.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
part 'edit_project_event.dart';
part 'edit_project_state.dart';

class EditProjectBloc extends Bloc<EditProjectEvent, EditProjectState> {
  String? id;

  late Projects project = getIt.get<DataLayer>().userInfo!.projects!.firstWhere(
        (project) => project.projectId == id,
      );

  //save logo
  File? logoImg;

  //save base info
  late String name = project.projectName ?? '';
  late String bootcampName = project.bootcampName ?? '';
  late String type = project.type ?? '';
  late String description = project.projectDescription ?? '';
//dates
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  late String? presentationDateFromDB = project.presentationDate;
  late String? startDateFromDB = project.startDate;
  late String? endDateFromDB = project.endDate;
  late DateTime? presentationDate =
      dateFormat.parse(presentationDateFromDB ?? '0000-00-00');
  late DateTimeRange? duration = DateTimeRange(
      start: dateFormat.parse(startDateFromDB ?? '0000-00-00'),
      end: dateFormat.parse(endDateFromDB ?? '0000-00-00'));

  //save imgs list
  List imgList = [];

  //save links
  late List<Map<String, dynamic>> links = project.linksProject;

  //save members
  late List members = project.membersProject;
  File presention = File('');

  EditProjectBloc() : super(EditProjectInitial()) {


    on<UpdateLogoEvent>((event, emit) {
      logoImg = event.logo;
      emit(UpdateProjectEntryState());
    });
    on<UpdatePresentationDateEvent>((event, emit) {

      presentationDate = event.date;
      emit(UpdateProjectEntryState());
    });

    on<UpdateProjectDurationEvent>((event, emit) {
      duration = event.date;
      emit(UpdateProjectEntryState());
    });

    on<EditProjectEvent>((event, emit) {});

    on<EditImagesEvent>((event, emit) {
      imgList = event.imgs;

      emit(UpdateProjectEntryState());
    });

    on<DeleteImagesEvent>((event, emit) {
      imgList.removeAt(event.imgsInt);

      emit(UpdateProjectEntryState());
    });

    on<AddMembersEvent>((event, emit) {
      members.add({'id': '', 'role': ''}); // Add row
      emit(UpdateProjectEntryState());
    });
    on<UpdateMembersEvent>((event, emit) {
      members[event.index] = {'id': event.id, 'role': event.role};
    });
    on<UpdateFileEvent>((event, emit) {
      presention = event.presentation;
      emit(UpdateProjectEntryState());
    });
    on<DeleteMembersEvent>((event, emit) {
      members..removeAt(event.index);
      emit(UpdateProjectEntryState());

    });
  }
}

Future<File?> convertBinaryToFile(List<int> binaryData) async {
  // This method converts binary data to a File
  final filePath = '${(await getTemporaryDirectory()).path}/logo.png';
  final file = File(filePath);
  file.writeAsBytesSync(Uint8List.fromList(binaryData));
  return file;
}
