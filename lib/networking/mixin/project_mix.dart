// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tuwaiq_project/networking/networking_constant.dart';

mixin ProjectMix on NetworkingConstant {
  chnagelogo(
      {required String token,
      required List<int> logoImg,
      required String projectId}) async {
    try {
      final res = await dio.put("$baseUrl$endProjectLogoEdit$projectId",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {"logo": logoImg});
      log(res.data);
      return res.data;
    } on DioException catch (err) {
      print(err.response?.data);
    } catch (err) {
      throw Exception;
    }
  }

  chnageBaseData({
    required String token,
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

      print('hhhhh${res.data}');
      return res.data;
    } on DioException catch (err) {
      print(err.response?.data);
      return err.response?.data['data'];
    } catch (err) {
      throw Exception;
    }
  }

  chnagePresentation({
    required String token,
    required List<int> presentationFile,
    required String projectId,
  }) async {
    try {
      final res = await dio.put("$baseUrl$endPresentationEdit$projectId",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {"presentation_file": presentationFile});

      print(res.data);
    } on DioException catch (err) {
      print(err.response?.data);
    } catch (err) {
      throw Exception;
    }
  }

  chnageImage({
    required String token,
    required List<List<int>> projectImgs,
    required String projectId,
  }) async {
    try {
      final res = await dio.put("$baseUrl$endProjectImgEdit$projectId",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {"images": projectImgs});

      print(res.data);
    } on DioException catch (err) {
      print(err.response?.data);
    } catch (err) {
      throw Exception;
    }
  }

  chnageLinks({
    required String token,
    required List<Map<String, dynamic>> links,
    required String projectId,
  }) async {
    try {
      final res = await dio.put("$baseUrl$endProjectLinksEdit$projectId",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {"link": links});

      print(res.data);
    } on DioException catch (err) {
      print(err.response?.data);
    } catch (err) {
      throw Exception;
    }
  }

  chnageMembers({
    required String token,
    required List<Map<String, dynamic>> members,
    required String projectId,
  }) async {
    try {
      final res = await dio.put("$baseUrl$endProjectMembersEdit$projectId",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {"members": members});

      print(res.data);
    } on DioException catch (err) {
      print(err.response?.data);
    } catch (err) {
      throw Exception;
    }
  }
}
