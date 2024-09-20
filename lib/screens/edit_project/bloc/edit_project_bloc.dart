import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_project_event.dart';
part 'edit_project_state.dart';

class EditProjectBloc extends Bloc<EditProjectEvent, EditProjectState> {
  List links = [
    // {"type": "github", "url": ""},
    // {"type": "figma", "url": ""},
    // {"type": "video", "url": ""},
    // {"type": "pinterest", "url": ""},
    // {"type": "playstore", "url": ""},
    // {"type": "applestore", "url": ""},
    // {"type": "apk", "url": ""},
    // {"type": "weblink", "url": ""}
  ];
  List imgList = [];
  List members = []; //put get here
  File presention = File('');
  EditProjectBloc() : super(EditProjectInitial()) {
    on<EditProjectEvent>((event, emit) {});

    on<EditImagesEvent>((event, emit) {
      imgList = event.imgs;

      emit(EditImagesState());
    });

    on<DeleteImagesEvent>((event, emit) {
      imgList.removeAt(event.imgsInt);

      emit(EditImagesState());
    });

    on<AddMembersEvent>((event, emit) {
      members.add({'id': '', 'role': ''}); // Add row
      emit(AddMemberState());
    });
    on<UpdateMembersEvent>((event, emit) {
      members[event.index] = {'id': event.id, 'role': event.role};
      print(members);
    });
    on<UpdateFileEvent>((event, emit) {
      presention = event.presentation;
      emit(EditFileState());
      print(presention);
    });
    on<DeleteMembersEvent>((event, emit) {
      members..removeAt(event.index);
      emit(AddMemberState());
    });
  }
}
