import 'package:dio/dio.dart';
import 'package:project_judge/network/constant_network.dart';

import '../../models/project_info_model.dart';

mixin ProjectDetails on ConstantNetwork {
  Future<ProjectsInfo> getProjectDetails() async {
    try {
      final projectResponse = await dio.get('$baseurl$getProjectEndPoint');
      ProjectsInfo projectModel = ProjectsInfo.fromJson(projectResponse.data['data']);
      return projectModel;
    } on DioException catch (e) {
      throw FormatException(e.response?.data['data']);
    } catch (e) {
      throw const FormatException("unknown error");
    }
  }
}
