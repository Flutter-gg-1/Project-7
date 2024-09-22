import 'package:dio/dio.dart';
import 'package:project_judge/network/constant_network.dart';

import '../../models/project_info_model.dart';

mixin ProjectDetails on ConstantNetwork {
  Future<List<ProjectsInfo>> getProjectDetails() async {
    try {
      final response =
          await dio.get('$baseurl$getFirstHundredProjectsEndPoint');
      print(response.statusCode);
      print(response.data);
      List<dynamic> projectsData = response.data['data']['projects'];
      print(projectsData);
      List<ProjectsInfo> firstHundredProjects =
          projectsData.map((e) => ProjectsInfo.fromJson(e)).toList();

      print(firstHundredProjects);

      return firstHundredProjects;
    } on DioException catch (e) {
      throw FormatException(e.response?.data['data']);
    } catch (e) {
      throw const FormatException("unknown error");
    }
  }
}
