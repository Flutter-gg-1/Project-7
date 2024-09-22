import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project7/data_layers/auth_layer.dart';
import 'package:project7/models/project_model.dart';
import 'package:project7/networking/const_api.dart';

mixin ProjectsApi on ConstantAPi {
  Future<List<ProjectModel>> getAllProjects() async {
    try {
      List<ProjectModel> projects = [];
      final response = await dio.get(baseURl + projectsEndPoint);
      // log(response.data.toString());
      for (var projectAsMap in response.data['data']['projects']) {
        projects.add(ProjectModel.fromJson(projectAsMap));
      }
      log(projects.length.toString());
      return projects;
    } on DioException catch (error) {
      throw FormatException(error.response?.data["data"]);
    } catch (error) {
      throw const FormatException("~there error with API");
    }
  }

  Future<void> createProject(
      {required String userId,
      required String deadline,
      required bool allowEditing}) async {
    try {
      final response = await dio.post(baseURl + createProjectEndPoint,
          data: {
            "user_id": userId,
            "time_end_edit": deadline,
            "edit": allowEditing
          },
          options: Options(headers: {
            'Authorization': 'Bearer ${GetIt.I.get<AuthLayer>().auth!.token}'
          }));
      return response.data["data"];
    } on DioException catch (error) {
      throw FormatException(error.response?.data["data"]);
    } catch (error) {
      throw const FormatException("~there error with API");
    }
  }

  editProjectBaseInfo({
    required String token,
    required String id,
    required String name,
    required String bootcamp,
    required String type,
    required String description,
    required String startDate,
    required String endDate,
    required String presentationDate,
  }) async {
    try {
      log("$baseURl$editProjectBaseEndPoint/$id");
      final response = await dio.put(
        "$baseURl$editProjectBaseEndPoint/$id",
        data: jsonEncode({
          "project_name": name,
          "bootcamp_name": bootcamp,
          "type": type,
          "start_date": startDate,
          "end_date": endDate,
          "presentation_date": presentationDate,
          "project_description": description
        }),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.data}');
    } on DioException catch (e) {
      log("-----");
      log(e.response?.data.toString() ?? "Error raised in edit project base info");
      log("-----");
    } catch (e) {
      log(e.toString());
    }
  }

  editProjectStatus({
    required String token,
    required String projectId,
    required String endDate,
    required bool isEditable,
    required bool isRatable,
    required bool isPublic,
  }) async {
    try {
      final response = await dio.put(
        "$baseURl$changeProjectStatusEndPoint/$projectId",
        data: jsonEncode({
          "time_end_edit": '11/12/2024',
          "edit": isEditable,
          "rating": isRatable,
          "public": isPublic
        }),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.data}');
    } on DioException catch (e) {
      log("-----");
      log(e.response?.data.toString() ?? "Error raised in edit project status");
      log("-----");
    } catch (e) {
      log(e.toString());
    }
  }
  editProjectPresentation({
    required String token,
    required String projectId,
    required String presentationPath,
  }) async {
    try {
      final presentation = await File(presentationPath!).readAsBytes();
      final response = await dio.put(
        "$baseURl$editProjectPresentationEndPoint/$projectId",
        data: jsonEncode({
          "presentation_file": presentation.toList(growable: false)
        }),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.data}');
    } on DioException catch (e) {
      log("-----");
      print(e.response?.data.toString());
      log("-----");
    } catch (e) {
      log(e.toString());
    }
  }


  deleteProject({required String token, required String projectId}) async {
    try {
      log("$baseURl$deleteProjectEndPoint/$projectId");
      final response = await dio.delete(
          "$baseURl$deleteProjectEndPoint/$projectId",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.data}');
    } on DioException catch (e) {
      log("-----");
      log(e.response?.data.toString() ?? "Error raised in delete project");
      log("-----");
    } catch (e) {
      log(e.toString());
    }
  }

  editProjectLogo({required String token, required String projectId, required String imgPath}) async {
    Uint8List? image;
    bool isValid = false;
    try {
      image = await File(imgPath).readAsBytes();
      isValid = true;
    } catch (_) {}
    try {
      final response = await dio.put(
        '$baseURl$editProjectLogoEndPoint/$projectId',
        data: jsonEncode({
          "logo": image?.toList(growable: false)
        }),
        options: Options(
          headers: {'Authorization': 'Bearer $token'}
        )
      );
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.data}');
    } on DioException catch (e) {
      log("-----");
      log(e.response?.data.toString() ?? "Error raised in edit project logo");
      log("-----");
    } catch (e) {
      log(e.toString());
    }
  }

  editProjectImages({required String token, required String projectId, required List<String> imgsPaths}) async {
    List<List<int>> result = [];
    for (var path in imgsPaths) {
      Uint8List temp = File(path).readAsBytesSync();
      result.add(temp.toList(growable: false));
    }
    try {
      final response = await dio.put(
        "$baseURl$editProjectImagesEndPoint/$projectId",
        data: jsonEncode({"images": result}),
        options: Options(headers: {'Authorization': 'Bearer $token'})
      );
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.data}');
    } on DioException catch (e) {
      log("-----");
      log(e.response?.data.toString() ?? "Error raised in edit project images");
      log("-----");
    } catch (e) {
      log(e.toString());
    }
  }
}
