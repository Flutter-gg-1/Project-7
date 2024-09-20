import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_management_app/models/member_model.dart';
import 'package:project_management_app/models/project_link.dart';
import 'package:project_management_app/networking/constants_api.dart';

mixin UserApi on ConstantsApi {
  rateProject(
      {required String projectId,
      required int idea,
      required int design,
      required int tools,
      required int practices,
      required int presentation,
      required int investment,
      required String note,
      required String token}) async {
    try {
      await dio.post(
        '$baseUrl$rateProjectEndpoint/$projectId',
        data: {
          'project_id': projectId,
          "idea": idea,
          "design": design,
          "tools": tools,
          "practices": practices,
          "presentation": presentation,
          "investment": investment,
          "note": note
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
    } catch (e) {
      throw Exception("Error occurred while rating project");
    }
  }

  editProjectLogo(
      {required String projectId,
      required List<int> logo,
      required String token}) async {
    Response? response;
    try {
      response = await dio.put(
        '$baseUrl$editProjectLogoEndpoint/$projectId',
        data: jsonEncode({"logo": logo}),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
    } catch (e) {
      log('${response?.data}');
      throw Exception("Error occurred while updating Logo");
    }
  }

  editProjectInfo(
    String projectId, {
    required String projectName,
    required String bootcampName,
    required String type,
    required String startDate,
    required String endDate,
    required String presentationDate,
    required String projectDescription,
    required String token,
  }) async {
    try {
      await dio.put(
        '$baseUrl$editProjectInfoEndpoint/$projectId',
        data: {
          'project_name': projectName,
          'bootcamp_name': bootcampName,
          'type': type,
          'start_date': startDate,
          'end_date': endDate,
          'presentation_date': presentationDate,
          'project_description': projectDescription,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
    } catch (e) {
      throw Exception("Error occurred while updating Info");
    }
  }

  editPresentation(
      {required String projectId,
      required List<int> presentationFile,
      required String token}) async {
    try {
      await dio.put(
        '$baseUrl$editPresentationEndpoint/$projectId',
        data: {'presentation_file': presentationFile},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
    } catch (e) {
      throw Exception("Error occurred while updating Presentation");
    }
  }

  editProjectImages(
      {required String projectId,
      required List<List<int>> images,
      required String token}) async {
    try {
      await dio.put(
        '$baseUrl$editProjectImageEndpoint/$projectId',
        data: {'images': images},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
    } catch (e) {
      throw Exception("Error occurred while updating Images");
    }
  }

  editProjectLinks(
      {required String projectId,
      required List<ProjectLink> links,
      required String token}) async {
    try {
     await dio.put(
        '$baseUrl$editProjectLinksEndpoint/$projectId',
        data: {
          'link': links.map((link) => link.toJson()).toList(),
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
    } on DioException catch (e) {
      throw DioException(requestOptions: RequestOptions(), message: '${e.response?.data['data']}');
    }
  }

  editProjectMembers(
      {required String projectId,
      required List<MemberModel> members,
      required String token}) async {
    try {
       await dio.put(
        '$baseUrl$editProjectMembersEndpoint/$projectId',
        data: {
          'members': members
              .map((member) => {
                    'position': member.position,
                    'user_id': member.userId,
                  })
              .toList(),
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
    } catch (e) {
      throw Exception("Error occurred while updating Members");
    }
  }
}
