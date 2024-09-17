import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/network/api_netowrok.dart';
import 'package:project_judge/setup/init_setup.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  ApiNetowrok api = ApiNetowrok();
  TextEditingController emailController = TextEditingController();
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  AuthCubit() : super(AuthInitial());

  checkAccounts() async {
    emit(LoadingState());

    try {
      await api.createAccount(
          email: emailController.text,
          fName: fNameController.text,
          lName: lNameController.text);
      emit(SuccessState());
    } on FormatException catch (e) {
      emit(ErrorState(msg: e.message));
    } catch (e) {
      emit(ErrorState(msg: e.toString()));
    }
  }

  checkAuth({required String email}) async {
    emit(LoadingState());
    try {
      await api.verifyAccount(email: email, otp: int.parse(otpController.text));
      await getIt.get<DataLayer>().getUserr();
      emit(SuccessState());
    } on FormatException catch (e) {
      emit(ErrorState(msg: e.message));
    } catch (e) {
      emit(ErrorState(msg: e.toString()));
    }
  }

  void checkLogin({required String email}) async {
    emit(LoadingState());
    try {
      await api.loginMethod(email: email);
      emit(SuccessState());
    } on FormatException catch (e) {
      emit(ErrorState(msg: e.message));
    } catch (e) {
      emit(ErrorState(msg: e.toString()));
    }
  }

  void resendOTP({required String email}) async {
    emit(LoadingState());
    try {
      await api.loginMethod(email: email);
      emit(ResendOtpState());
    } on FormatException catch (e) {
      emit(ErrorState(msg: e.message));
    } catch (e) {
      emit(ErrorState(msg: e.toString()));
    }
  }
}
