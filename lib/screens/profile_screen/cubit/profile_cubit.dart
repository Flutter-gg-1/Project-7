import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController githubController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cvController = TextEditingController();
  

  getProfileData(String firstName, String lastName, String github,
      String linkedin, String email, String cv) {
        emit(getProfileData(firstName, lastName, github, linkedin, email, cv));
      }
}
