import 'package:dio/dio.dart';
import 'package:tuwaiq_project/networking/networking_constant.dart';

mixin SupervisorMix on NetworkingConstant {
  createProject({
    required String userId,
    required String timeEditEnd,
    required bool isEdit,
  }) async {
    try {
      final res = await dio.post("$baseUrl$endProjectCreate",
          options: Options(headers: {'Authorization': 'Bearer $currentToken'}),
          data: {
            "user_id": userId,
            "time_end_edit": timeEditEnd,
            "edit": isEdit.toString()
          });
    } on DioException catch (err) {
      throw DioException(
          requestOptions: RequestOptions(),
          message: '${err.response?.data['data']}');
    } catch (err) {
      throw Exception;
    }
  }

  changeProjectState({
    required String timeEndEdit,
    required bool allowEdit,
    required bool allowRating,
    required bool allowPublic,
    required String projectId,
  }) async {
    try {
      final res = await dio.put("$baseUrl$endProjectChangeState$projectId",
          options: Options(headers: {'Authorization': 'Bearer $currentToken'}),
          data: {
            "time_end_edit": timeEndEdit,
            "edit": allowEdit,
            "rating": allowRating,
            "public": allowPublic
          });
    } on DioException catch (err) {
      throw err.response?.data ?? 'Unknown error occurred';
    } catch (err) {
      throw Exception;
    }
  }

  delproject({
    required String projectId,
  }) async {
    try {
      final res = await dio.delete(
        "$baseUrl$endProjectDel$projectId",
        options: Options(headers: {'Authorization': 'Bearer $currentToken'}),
      );
    } on DioException catch (err) {
      throw DioException(
          requestOptions: RequestOptions(),
          message: '${err.response?.data['data']}');
    } catch (err) {
      throw Exception;
    }
  }
}
