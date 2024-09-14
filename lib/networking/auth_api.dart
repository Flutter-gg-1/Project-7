import 'package:dio/dio.dart';
import 'package:tuwaiq_project_pulse/networking/_client/api_path.dart';

import '_client/network_mgr.dart';

class AuthApi extends NetworkMgr {
  Response? response;
  String errorMsg = '';
  // POST
  Future<void> createUser({
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    response = await dio.post(ApiPath.auth.createAccount,
        data: {"email": email, "f_name": firstName, "l_name": lastName});
  }

  // POST
  Future<void> login({
    required String email,
  }) async {
    try {
      response = await dio.post(ApiPath.auth.login, data: {"email": email});
    } catch (e) {
      errorMsg = e.toString();
    }
  }

  // POST
  Future<void> verifyOTP({
    required String email,
    required int otp, // 6 digit number
  }) async {
    try {
      response = await dio
          .post(ApiPath.auth.otpVerify, data: {"email": email, "otp": '$otp'});
    } catch (e) {
      errorMsg = e.toString();
    }
  }
}
