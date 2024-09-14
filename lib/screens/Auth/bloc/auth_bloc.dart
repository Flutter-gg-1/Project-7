import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project_management_app/networking/api_networking.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState>  {
  TextEditingController? controllerEmail = TextEditingController();
  TextEditingController? controllerFName = TextEditingController();
  TextEditingController? controllerLName = TextEditingController();
  final api = ApiNetworking();
  CreateAccountBloc() : super(CreateAccountInitial()) {
    on<CreateEvent>(createMethod);
  }

  FutureOr<void> createMethod(
      CreateEvent event, Emitter<CreateAccountState> emit) async {
    try {
      emit(LoadingState());
      final emailCreate = await api.createNewAccount(
          email: controllerEmail!.text,
          firstName: controllerFName!.text,
          lastName: controllerLName!.text);
      print(emailCreate);
      emit(SuccessState());
    } on FormatException catch (error) {
      emit(ErrorState(msg: error.message));
    } catch (error) {
      emit(ErrorState(msg: "There is error with code 194FR94"));
    }
  }
}
