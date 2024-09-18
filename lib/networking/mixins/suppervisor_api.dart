import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_management_app/models/project_model.dart';
import 'package:project_management_app/networking/constants_api.dart';

mixin SupervisorApi on ConstantsApi {
  Future<ProjectModel> createProject({
    required String token,
    required String userId,
    required String timeEndEdit,
    required bool isEditable,
  }) async {
    try {
      final response = await dio.post(
        '$baseUrl$createProjectEndpoint',
        data: {
          'user_id': userId,
          'time_end_edit': timeEndEdit,
          'edit': isEditable.toString(),
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return ProjectModel.fromJson(
          Map<String, dynamic>.from(response.data['data']));
    } on DioException catch (error) {
      log('DioException: ${error.message}');
      throw const FormatException('Unknown error occurred');
    } catch (error) {
      throw const FormatException("Error occurred while creating project");
    }
  }

  Future<ProjectModel> changeProjectStatus({
    required String token,
    required String projectId,
    required String timeEndEdit,
    required bool isEditable,
    required bool isPublic,
  }) async {
    try {
      final response = await dio.put(
        '$baseUrl$changeProjectStatusEndpoint$projectId',
        data: {
          'time_end_edit': timeEndEdit,
          'edit': isEditable,
          'public': isPublic,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return ProjectModel.fromJson(
          Map<String, dynamic>.from(response.data['data']));
    } on DioException catch (error) {
      log('DioException: ${error.message}');
      throw const FormatException('Unknown error occurred');
    } catch (error) {
      log('Unknown error: $error');
      throw const FormatException(
          'Error occurred while changing project status');
    }
  }

  Future<void> deleteProject({
    required String token,
    required String projectId,
  }) async {
    try {
      final response = await dio.delete(
        '$baseUrl$deleteProjectEndpoint$projectId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.data['msg'] != 'success') {
        throw const FormatException('Failed to delete project');
      }
    } on DioException catch (error) {
      log('DioException: ${error.message}');
      throw const FormatException('Unknown error occurred');
    } catch (error) {
      log('Unknown error: $error');
      throw const FormatException('Error occurred while deleting project');
    }
  }
}
