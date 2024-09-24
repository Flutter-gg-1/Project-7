import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tuwaiq_project/data_layer/auth_layer.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/models/user_model.dart';
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
        final UserModel userAuth =
            await api.verifyOtp(email: event.email, otp: otp!);

        await authLocator.get<AuthLayerData>().saveAuth(authData: userAuth);
        var temp = await api.profileGet();

        userAuth.id = temp.id;

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

    on<ReSendOtpEvent>((event, emit) async {
      emit(LoadingState());

      try {
        final emailLogin = await api.userLogin(
          email: event.email.trim(),
        );
        emit(ReSendOtpState());
      } catch (err) {
        emit(ErrorState(msg: "There is error with on the server"));
      }
    });
  }
}
