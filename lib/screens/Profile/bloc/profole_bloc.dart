import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_management_app/models/profile_model.dart';
import 'package:project_management_app/networking/api_networking.dart';

part 'profole_event.dart';
part 'profole_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ApiNetworking api;
  final String token; 

  ProfileBloc({required this.api, required this.token}) : super(ProfileLoadingState()) {
    on<FetchProfileEvent>(_onFetchProfile);
  }

  void _onFetchProfile(
    FetchProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState());
    try {
      // Pass the token when fetching the profile
      final profile = await api.getProfile(token);
      emit(ProfileLoadedState(profile: profile));
    } catch (error) {
      emit(ProfileErrorState(error: error.toString()));
    }
  }
}