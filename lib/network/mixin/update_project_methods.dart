import 'package:dio/dio.dart';
import 'package:project_judge/models/user_model.dart';
import 'package:project_judge/network/constant_network.dart';

mixin UpdateProjectMethods on ConstantNetwork {
  Future updateProject({
    required String projectID,
    required String token,
    required String name,
    required String bootcamp,
    required String type,
    required String start,
    required String end,
    required String presentationDate,
    required String desc,
  }) async {

    // //update logo
    // try {
    //   await dio.put("$baseurl$updateProjectLogoEndPoint/$id",
    //       data: {
    //         "logo": logo,
    //       },
    //       options: Options(headers: {"Authorization": "Bearer $token"}));
    // } on DioException catch (e) {
    //   throw FormatException(e.response?.data['data']);
    // } catch (e) {
    //   throw FormatException(e.toString());
    // }

    //update base
    try {
      final response = await dio.put("https://tuwaiq-gallery.onrender.com/v1/user/edit/project/base/p-43vSLzqjTy",
          data: {
            "project_name": name,
            "bootcamp_name": bootcamp,
            "type": type,
            "start_date": start,
            "end_date": end,
            "presentation_date": presentationDate,
            "project_description": desc
          },
          options: Options(headers: {"Authorization": "Bearer $token"}));
          print(response);
    } on DioException catch (e) {
      throw FormatException(e.response?.data['data']);
    } catch (e) {
      throw FormatException(e.toString());
    }

    //   //update presentation
    //   try {
    //     await dio.put("$baseurl$updateProjectPresentationEndPoint/$id",
    //         data: {
    //           "presentation_file": presentation,
    //         },
    //         options: Options(headers: {"Authorization": "Bearer $token"}));
    //   } on DioException catch (e) {
    //     throw FormatException(e.response?.data['data']);
    //   } catch (e) {
    //     throw FormatException(e.toString());
    //   }

    //   //update images
    //   try {
    //     await dio.put("$baseurl$updateProjectImagesEndPoint/$id",
    //         data: {
    //           "images": imagesList,
    //         },
    //         options: Options(headers: {"Authorization": "Bearer $token"}));
    //   } on DioException catch (e) {
    //     throw FormatException(e.response?.data['data']);
    //   } catch (e) {
    //     throw FormatException(e.toString());
    //   }

    //   //update link
    //   try {
    //     await dio.put("$baseurl$updateProjectImagesEndPoint/$id",
    //         data: {
    //           "link": link,
    //         },
    //         options: Options(headers: {"Authorization": "Bearer $token"}));
    //   } on DioException catch (e) {
    //     throw FormatException(e.response?.data['data']);
    //   } catch (e) {
    //     throw FormatException(e.toString());
    //   }

    //   //update members
    //   try {
    //     await dio.put("$baseurl$updateProjectImagesEndPoint/$id",
    //         data: {
    //           "members": members,
    //         },
    //         options: Options(headers: {"Authorization": "Bearer $token"}));
    //   } on DioException catch (e) {
    //     throw FormatException(e.response?.data['data']);
    //   } catch (e) {
    //     throw FormatException(e.toString());
    //   }
  }
}
