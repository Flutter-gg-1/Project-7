import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tuwaiq_project/networking/networking_api.dart';

part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit() : super(UpdateInitial());

  updateProfile(
      {required String firstName,
      required String lastName,
      required String bindLink,
      required String linkedinLink,
      required String githubLink,
      required List<int>? imgCubitFile,
      required List<int>? cvFile}) async {
    try {
      emit(UpdateLodaingState());
      githubLink =
          githubLink.replaceFirst(RegExp(r'https?://'), '').replaceAll(' ', '');
      linkedinLink = linkedinLink
          .replaceFirst(RegExp(r'https?://'), '')
          .replaceAll(' ', '');
      bindLink =
          bindLink.replaceFirst(RegExp(r'https?://'), '').replaceAll(' ', '');

      await NetworkingApi().updateProfile(
          firstName: firstName,
          lastName: lastName,
          profileImg: imgCubitFile,
          cvImg: cvFile,
          bindLink: bindLink,
          linkedinLink: linkedinLink,
          githubLink: githubLink);

      emit(GoodState());
    } catch (err) {
      if (err is Map) {
        emit(UpdateErorrState(msg: err["data"]));
      } else {
        emit(UpdateErorrState(msg: err.toString()));
      }
    }
  }
}
