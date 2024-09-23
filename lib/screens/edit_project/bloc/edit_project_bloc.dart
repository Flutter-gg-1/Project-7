import 'dart:io';
import 'dart:math';
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
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
part 'edit_project_event.dart';
part 'edit_project_state.dart';

class EditProjectBloc extends Bloc<EditProjectEvent, EditProjectState> {
  String? id;

  late Projects project = getIt.get<DataLayer>().userInfo!.projects!.firstWhere(
        (project) => project.projectId == id,
      );

  //save logo
  File? logoImg; // to save the img from gallary
  // late String savedLogo = project.logoUrl ?? '';

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
  late List<MembersProject> members = project.membersProject;

  //
  File presention = File('');

  EditProjectBloc() : super(EditProjectInitial()) {
    on<UpdateLogoEvent>((event, emit) {
      logoImg = event.logo;
      emit(UpdateProjectEntryState());
    });

    on<UpdatePresentationDateEvent>((event, emit) {
      print(members.toString());
      print(members);
      presentationDate = event.date;
      emit(UpdateProjectEntryState());
    });

    on<UpdateProjectDurationEvent>((event, emit) {
      duration = event.date;
      emit(UpdateProjectEntryState());
    });
    on<UpdateLinksEvent>((event, emit) {
      Map<String, String?> currentLinksMap = {
        for (var link in links) link['type']: link['url']
      };

      // Update the links list based on the event
      links = [
        {
          "type": "github",
          "url": event.github ?? currentLinksMap['github'] ?? ''
        },
        {"type": "figma", "url": event.figma ?? currentLinksMap['figma'] ?? ''},
        {"type": "video", "url": event.video ?? currentLinksMap['video'] ?? ''},
        {
          "type": "pinterest",
          "url": event.pinterest ?? currentLinksMap['pinterest'] ?? ''
        },
        {
          "type": "playstore",
          "url": event.playstore ?? currentLinksMap['playstore'] ?? ''
        },
        {
          "type": "applestore",
          "url": event.applestore ?? currentLinksMap['applestore'] ?? ''
        },
        {"type": "apk", "url": event.apk ?? currentLinksMap['apk'] ?? ''},
        {
          "type": "weblink",
          "url": event.web ?? currentLinksMap['weblink'] ?? ''
        },
      ];

      // Emit the updated state
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
      members.add(MembersProject(
        id: '',
        position: '',
      ));
      emit(UpdateProjectEntryState());
    });

    on<UpdateMembersEvent>((event, emit) {
      members[event.index] = MembersProject(
        id: event.id, // Update id
        firstName: members[event.index].firstName, // Keep
        lastName: members[event.index].lastName, // Keep
        email: members[event.index].email,
        position: event.role, // Update position
        imageUrl: members[event.index].imageUrl, // Keep
        link: members[event.index].link, // Keep
      );
      emit(UpdateProjectEntryState());
    });

    on<DeleteMembersEvent>((event, emit) {
      members.removeAt(event.index); // Remove member
      emit(UpdateProjectEntryState());
    });
    on<UpdateFileEvent>((event, emit) {
      presention = event.presentation;
      emit(UpdateProjectEntryState());
    });
  }
}
