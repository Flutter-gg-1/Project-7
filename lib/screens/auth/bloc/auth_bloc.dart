import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tuwaiq_project/data_layer/auth_layer.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/networking/networking_api.dart';
import 'package:tuwaiq_project/services/setup.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final language = languageLocaitor.get<LanguageLayer>();
  final api = NetworkingApi();
  String? otp;
  TextEditingController? controllerEmail =
      TextEditingController(text: "dev@gmail.com");
  TextEditingController? controllerFName = TextEditingController(text: "basel");
  TextEditingController? controllerLName = TextEditingController(text: "saad");
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    //========Create Account============
    on<CreateAccountEvent>((event, emit) async {
      try {
        emit(LoadingState());

        final emailCreate = await api.createUserAccount(
            email: controllerEmail!.text,
            fName: controllerFName!.text,
            lName: controllerLName!.text);
        print(emailCreate);
        emit(SuccessState());
      } on FormatException catch (error) {
        emit(ErrorState(msg: error.message));
      } catch (error) {
        emit(ErrorState(msg: "There is error with on the server"));
      }
    });
    //=============Login=================
    on<LoginEvent>((event, emit) async {
      try {
        emit(LoadingState());

        final emailLogin = await api.userLogin(
          email: controllerEmail!.text,
        );
        print(emailLogin);
        emit(SuccessState());
      } on FormatException catch (error) {
        emit(ErrorState(msg: error.message));
      } catch (error) {
        emit(ErrorState(msg: "There is error with on the server"));
      }
    });
    //=============otp verfication=================
    on<VerfieyEvent>((event, emit) async {
    try {
      emit(LoadingState());
      log('loading');
      final userAuth = await api.verifyOtp(email: event.email, otp: otp!);
      log('2');
      await authLocator.get<AuthLayerData>().saveAuth(authData: userAuth);
      emit(SuccessState());
    } catch (error) {
      emit(ErrorState(msg: "There is error with on the server"));
    }
    });

    //========Change Language============
    on<LanguageChangeEvent>((event, emit) {
      language.isArabic = !language.isArabic;
      emit(ArabicState(isArabic: language.isArabic));
    });
  }
}
