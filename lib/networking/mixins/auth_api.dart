import 'package:project_management_app/models/auth_model.dart';
import 'package:project_management_app/networking/constants_api.dart';
import 'package:dio/dio.dart';

mixin AuthApi on ConstantsApi{



  resendOtp(){}

  login(){}

Future<String> createNewAccount(
      {required String email,
      required String firstName,
      required String lastName}) async {
    try {
      final response = await dio.post(baseUrl + creatAccountEndpoint, data: {
        "email": email.trim(),
        "f_name": firstName.trim(),
        "l_name": lastName.trim()
      });
      return response.data["data"]["email"];
    } on DioException catch (error) {
      throw FormatException(error.response?.data["data"]);
    } catch (error) {
      throw const FormatException("~there error with API");
    }
  }

  //----------------------
  Future<AuthModel> verifyOTP({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await dio.post(baseUrl + verifyEndpoint, data: {
        "email": email.trim(),
        "otp": otp.trim(),
      });
      return AuthModel.fromJson(response.data["data"]);
    } on DioException catch (error) {
      throw FormatException(error.response?.data["data"]);
    } catch (error) {
      throw const FormatException("~there error with API");
    }
  }

}