import 'package:dio/dio.dart';
import 'package:project_judge/network/constant_network.dart';

mixin CreateProjecttMethod on ConstantNetwork {
  Future<void> createProject(
      {required String token,
      required String userID,
      required String date,
      required String edit}) async {
    try {
       await dio.post(
          "https://tuwaiq-gallery.onrender.com/v1/supervisor/create/project",
          data: {"user_id": userID, "time_end_edit": date, "edit": edit},
          options: Options(headers: {
            "Authorization":
                "Bearer $token"
          }));
     // return(respose.data['data']['project_id']);
    } on DioException catch (e) {
      throw FormatException(e.response?.data['data']);
    } catch (e) {
      throw FormatException("unkown error $e");
    }
  }
}
