import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tuwaiq_project/data_layer/auth_layer.dart';
import 'package:tuwaiq_project/models/profile_model.dart';
import 'package:tuwaiq_project/models/projects_model.dart';
import 'package:tuwaiq_project/networking/networking_constant.dart';
import 'package:tuwaiq_project/services/setup.dart';

mixin ProjectMix on NetworkingConstant {
  chnagelogo({required List<int> logoImg, required String projectId}) async {
    try {
      String token = authLocator.get<AuthLayerData>().auth!.token!;
      final res = await dio.put("$baseUrl$endProjectLogoEdit$projectId",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {"logo": logoImg});

      return res.data;
    } on DioException catch (err) {
      throw err.response?.data ?? 'Unknown error occurred';
    } catch (err) {
      throw Exception;
    }
  }

  chnageBaseData({
    required String projectId,
    required String projectName,
    required String bootcampName,
    required String type,
    required String startDate,
    required String endDate,
    required String presentationDate,
    required String projectDescription,
  }) async {
    try {
      String token = authLocator.get<AuthLayerData>().auth!.token!;
      final res = await dio.put("$baseUrl$endProjectBaseEdit$projectId",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {
            "project_name": projectName,
            "bootcamp_name": bootcampName,
            "type": type,
            "start_date": startDate,
            "end_date": endDate,
            "presentation_date": presentationDate,
            "project_description": projectDescription
          });
      return res.data;
    } on DioException catch (err) {
      return err.response?.data['data'];
    } catch (err) {
      throw Exception;
    }
  }

  chnagePresentation({
    required List<int> presentationFile,
    required String projectId,
  }) async {
    try {
      String token = authLocator.get<AuthLayerData>().auth!.token!;
      final res = await dio.put("$baseUrl$endPresentationEdit$projectId",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {"presentation_file": presentationFile});
    } on DioException catch (err) {
      throw err.response?.data ?? 'Unknown error occurred';
    } catch (err) {
      throw Exception;
    }
  }

  chnageImage({
    required List<List<int>> projectImgs,
    required String projectId,
  }) async {
    try {
      String token = authLocator.get<AuthLayerData>().auth!.token!;
      final res = await dio.put("$baseUrl$endProjectImgEdit$projectId",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {"images": projectImgs});
    } on DioException catch (err) {
      throw err.response?.data ?? 'Unknown error occurred';
    } catch (err) {
      throw Exception;
    }
  }

  chnageLinks({
    required List<Map<String, dynamic>> links,
    required String projectId,
  }) async {
    try {
      String token = authLocator.get<AuthLayerData>().auth!.token!;
      final res = await dio.put("$baseUrl$endProjectLinksEdit$projectId",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {"link": links});
    } on DioException catch (err) {
      throw err.response?.data ?? 'Unknown error occurred';
    } catch (err) {
      throw Exception;
    }
  }

  chnageMembers({
    required List<Map<String, dynamic>> members,
    required String projectId,
  }) async {
    try {
      String token = authLocator.get<AuthLayerData>().auth!.token!;
      final res = await dio.put("$baseUrl$endProjectMembersEdit$projectId",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {"members": members});
    } on DioException catch (err) {
      throw err.response?.data ?? 'Unknown error occurred';
    } catch (err) {
      throw Exception;
    }
  }

  ratingProject({
    required String projectId,
    required String note,
    required double idea,
    required double design,
    required double tools,
    required double practices,
    required double presentation,
    required double investment,
  }) async {
    try {
      String token = authLocator.get<AuthLayerData>().auth!.token!;
      final res = await dio.post(
        '$baseUrl$endProjectRating$projectId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: {
          'note': note,
          'idea': idea.toInt(),
          'design': design.toInt(),
          'tools': tools.toInt(),
          'practices': practices.toInt(),
          'presentation': presentation.toInt(),
          'investment': investment.toInt(),
        },
      );
    } on DioException catch (error) {
      throw error.response?.data ?? 'Unknown error occurred';
    } catch (e) {
      throw Exception;
    }
  }

  Future<List<ProjectsModel>> getAllProject() async {
    try {
      final res = await dio.get(
        "$baseUrl$endGetAllProject",
      );
      List<ProjectsModel> lis = [];

      for (var val in res.data["data"]["projects"]) {
        lis.add(ProjectsModel.fromJson(val));
      }
      return lis;
    } on DioException catch (err) {
      throw "${err.response?.data}";
    } catch (err) {
      throw "there was erorr";
    }
  }
}
