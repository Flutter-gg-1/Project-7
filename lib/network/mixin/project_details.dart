import 'package:dio/dio.dart';
import 'package:project_judge/models/user_model.dart';
import 'package:project_judge/network/constant_network.dart';


mixin ProjectDetails on ConstantNetwork {
  Future<List<Projects>> getProjectDetails() async {
    try {
      final response =
          await dio.get('$baseurl$getFirstHundredProjectsEndPoint');
      print(response.statusCode);
      print(response.data);
      List<dynamic> projectsData = response.data['data']['projects'];
      print(projectsData);
      List<Projects> firstHundredProjects =
          projectsData.map((e) => Projects.fromJson(e)).toList();

      print(firstHundredProjects);

      return firstHundredProjects;
    } on DioException catch (e) {
      throw FormatException(e.response?.data['data']);
    } catch (e) {
      throw  FormatException(e.toString());
    }
  }
}
