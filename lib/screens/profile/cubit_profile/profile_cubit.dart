import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tuwaiq_project/models/profile_model.dart';
import 'package:tuwaiq_project/networking/networking_api.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  getProfile() async {
    log("in the get");
    // try {
    emit(ProfileInitial());

    ProfileModel profileModel = await NetworkingApi().profileGet();
    emit(ShowProfileState(profileModel: profileModel));

    // }
    // catch (err) {
    //   log("in the erorr");

    //   emit(ErorrState(msg: err.toString()));
    // }
  }

  updateProfile(
      {required String firstName,
      required String lastName,
      required String bindLink,
      required String linkedinLink,
      required String githubLink,
      required List<int>? imgCubitFile,
      required List<int>? cvFile}) async {
    await NetworkingApi().updateProfile(
        firstName: firstName,
        lastName: lastName,
        profileImg: imgCubitFile,
        cvImg: cvFile,
        bindLink: bindLink,
        linkedinLink: linkedinLink,
        githubLink: githubLink);

    getProfile();

    try {} catch (_) {}
  }

//   imageShow(List<int>? imgFile) {
//     if (imgFile != null) {
//       imgCubitFile = imgFile;
//       emit(ImageHereState(imgFile: imgFile));
//     }

//     if (imgFile == null) {
//       emit(ImageNoState());
//     }
//   }

//   imageAdd(List<int> imgFile) {
//     imgCubitFile = imgFile;
//     emit(ImageHereState(imgFile: imgFile));
//   }

//   imageDel() {
//     imgCubitFile = null;
//     emit(ImageNoState());
//   }
// }
}
