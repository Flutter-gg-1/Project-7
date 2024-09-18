import 'dart:developer';

import 'package:project_management_app/models/project_model.dart';
import 'package:project_management_app/networking/constants_api.dart';

mixin PublicApi on ConstantsApi {
  getProject(String projectId) async {
    final String projectIdEndpoint = '/$projectId';
    try {
      final response =
          await dio.get('$baseUrl$getProjectEndpoint$projectIdEndpoint');

      if (response.statusCode == 200) {
        final projectsData =
            List<Map<String, dynamic>>.from(response.data['projects']);
        if (projectsData != null && projectsData is List) {
          final projects = projectsData
              .map((project) => ProjectModel.fromJson(project))
              .toList();
          return projects.where((project) => project.isPublic == true).toList();
        }
      } else {
        throw Exception('Project not found');
      }
    } catch (e) {
      throw const FormatException("Error occurred while getting project");
    }
  }

  Future<List<ProjectModel>> getAllPublicProjects() async {
    final response = await dio.get('$baseUrl$getProjectsListEndpoint');

    if (response.statusCode == 200) {
      final projectsData =
          List<Map<String, dynamic>>.from(response.data['data']['projects']); 
      if (projectsData != null && projectsData is List) {
        final projects = projectsData
            .map((project) => ProjectModel.fromJson(project))
            .toList();
        return projects.where((project) => project.isPublic == true).toList();
      } else {
        throw Exception('Unexpected data format');
      }
    } else {
      throw Exception('Failed to load projects');
    }
  }

  Future<List<ProjectModel>> getRecentProjects() async {
    final response = await dio.get('$baseUrl$getProjectsListEndpoint');
    if (response.statusCode == 200) {
      final projectsData =
          List<Map<String, dynamic>>.from(response.data['data']['projects']);
      if (projectsData != null && projectsData is List) {
        final projects = projectsData
            .map((project) => ProjectModel.fromJson(project))
            .toList();
        projects.sort((a, b) => b.createAt!.compareTo(a.createAt!));
        return projects.take(6).toList();
      } else {
        throw Exception('Unexpected data format');
      }
    } else {
      throw Exception('Failed to load Recent projects');
    }
  }
}
