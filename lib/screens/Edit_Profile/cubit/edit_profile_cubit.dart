import 'dart:typed_data';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_management_app/networking/api_networking.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  File? profileImage;
  File? resumeFile;

  EditProfileCubit() : super(EditProfileInitial());

  void pickProfileImage(File image) {
    profileImage = image;
  }

  void pickResume(File resume) {
    resumeFile = resume;
  }

  Future<void> saveProfile({
    required String firstName,
    required String lastName,
    required String github,
    required String bindlink,
    required String linkedin,
    required File? resumeFile,
    required String token,
  }) async {
    emit(EditProfileLoading());
    try {
      Uint8List? imageData;
      Uint8List? resumeData;

      if (profileImage != null) {
        imageData = await profileImage!.readAsBytes();
      }

      if (resumeFile != null) {
        resumeData = await resumeFile!.readAsBytes();
      }

      await ApiNetworking().updateProfile(
        token: token,
        firstName: firstName,
        lastName: lastName,
        image: imageData?.toList(),
        cv: resumeData?.toList(),
        accounts: {
          'github': github,
          'linkedin': linkedin,
          'bindlink': bindlink,
        },
      );

      emit(EditProfileSuccess());
    } catch (e) {
      emit(EditProfileFailure(e.toString()));
    }
  }
}
