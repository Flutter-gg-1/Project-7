import 'package:dio/dio.dart';
import 'package:project_management_app/models/user_model.dart';
import 'package:project_management_app/networking/constants_api.dart';

mixin AdminApi on ConstantsApi {
  changeRole(
      {required UserModel user,
      required String role,
      required String token}) async {
    try {
      await dio.put(
        baseUrl + updateProfileEndpoint,
        data: {"id_user": user.id, "role": role},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioException catch (error) {
      throw FormatException(error.response?.data["data"]);
    } catch (error) {
      throw const FormatException("Error occurred while changing role");
    }
  }
}