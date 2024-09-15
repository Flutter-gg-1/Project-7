// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:tuwaiq_project/networking/networking_constant.dart';

mixin SupervisorMix on NetworkingConstant {
  createProject({
    required String token,
    required String userId,
    required String timeEditEnd,
    required bool isEdit,
    required String projectId,
  }) async {
    try {
      final res = await dio.post("$baseUrl$endProjectCreate",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {
            "user_id": userId,
            "time_end_edit": timeEditEnd,
            "edit": isEdit.toString()
          });

      print(res.data);
    } on DioException catch (err) {
      print(err.response?.data);
    } catch (err) {
      throw Exception;
    }
  }

  changeProjectState({
    required String token,
    required String timeEndEdit ,
    required bool allowEdit ,
    required bool allowRating ,
    required bool allowPublic ,
    required String projectId,
  }) async {
    try {
      final res = await dio.put("$baseUrl$endProjectChangeState$projectId",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {
            "time_end_edit": timeEndEdit,
            "edit": allowEdit,
            "rating": allowRating,
            "public": allowPublic
          });

      print(res.data);
    } on DioException catch (err) {
      print(err.response?.data);
    } catch (err) {
      throw Exception;
    }
  }




  delproject({
    required String token,
    
    required String projectId,
  }) async {
    try {
      final res = await dio.delete("$baseUrl$endProjectDel$projectId",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
         );

      print(res.data);
    } on DioException catch (err) {
      print(err.response?.data);
    } catch (err) {
      throw Exception;
    }
  }
}
