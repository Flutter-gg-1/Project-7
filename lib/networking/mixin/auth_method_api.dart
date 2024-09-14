import 'package:dio/dio.dart';
import 'package:tuwaiq_project/models/user_model.dart';
import 'package:tuwaiq_project/networking/networking_constant.dart';

mixin AuthMethodApi on NetworkingConstant {
  // checked
  createUserPost(
      {required String email,
      required String fName,
      required String lName}) async {
    try {
      final res = await dio.post("$baseUrl$endCreateUser", data: {
        "email": email.trim(),
        "f_name": fName.trim(),
        "l_name": lName.trim()
      });
    } on DioException catch (error) {
      throw FormatException(error.response?.data["data"]);
    } catch (error) {
      throw const FormatException("~there error with Server");
    }
  }

  loginPost({required String email}) async {
    try {
      final res =
          await dio.post("$baseUrl$endCreateUser", data: {"email": email});

      print(res.data);
    } on DioException catch (error) {
      throw FormatException(error.response?.data["data"]);
    } catch (error) {
      throw const FormatException("~there error with Server");
    }
  }

// form here take token
  verifyPost({required String email, required String otp}) async {
    try {
      final res = await dio
          .post("$baseUrl$endCreateUser", data: {"email": email, "otp": otp});
      
      print(res.data);
      return UserModel.fromJson(res.data["data"]);
    } on DioException catch (error) {
      throw FormatException(error.response?.data["data"]);
    } catch (error) {
      throw const FormatException("~there error with Server");
    }
  }
}
