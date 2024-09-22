import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_management_app/models/profile_model.dart';
import 'package:project_management_app/models/project_model.dart';
import 'package:project_management_app/networking/constants_api.dart';

mixin ProfileApi on ConstantsApi {
  Future<Profile> getProfile(String token) async {
    try {
      final response = await dio.get(
        '$baseUrl$getProfileEndpoint',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return Profile.fromJson(Map<String, dynamic>.from(response.data["data"]));
    } on DioException catch (error) {
      log('DioException: ${error.message}');
      throw FormatException(
          error.response?.data["msg"] ?? "Unknown error occurred");
    } catch (error) {
      log('Unknown error: $error');
      throw const FormatException("Error occurred while getting profile");
    }
  }

  Future<void> updateProfile({
    required String token,
    required String firstName,
    required String lastName,
    required List<int>? image,
    required List<int>? cv,
    required Map<String,dynamic> accounts,
    required List<ProjectModel> projects
  }) async {
   
    try {
      await dio.put(
        '$baseUrl$updateProfileEndpoint',
        data: {
          "first_name": firstName.trim(),
          "last_name": lastName.trim(),
          "image": image,
          "cv": cv,
          "accounts": accounts,
          "projects": projects
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioException catch (error) {
      log('DioException: ${error.response?.data["data"]}');
      throw FormatException(error.response?.data["data"]);
    } catch (error) {
      log('Unknown error: $error');
      throw const FormatException("Error occurred while updating profile");
    }
  }

//   editProfile({
//     required String token,
//     required String firstName,
//     required String lastName,
//     required String? imagePath,
//     required String? cvPath,
//     required String bindlink,
//     required String github,
//     required String linkedin,
//   }) async {
//     Uint8List? image;
//     Uint8List? cv;
//     bool validImage = false;
//     bool validCv = false;
//     try {
//       image = await File(imagePath!).readAsBytes();
//       validImage = true;
//     } catch (_) {}
//     try {
//       cv = await File(cvPath!).readAsBytes();
//       validCv = true;
//     } catch (_) {}
//     try {
//       // log(image.toString());
//       // log(cv.toString());
//       // log(imagePath.toString());
//       // log(cvPath.toString());
//       final datax = {
//         "first_name": firstName,
//         "last_name": lastName,
//         "image":image?.toList(growable: false),
//         "cv": cv?.toList(growable: false),
//         "accounts": {
//           "bindlink": bindlink,
//           "linkedin": linkedin,
//           "github": github
//         }
//       };
//       datax.removeWhere((k, v) => v == null);
//       print(datax);
//       final response = await dio.put(
//         baseURl + editProfileEndPoint,
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//         data: datax,
//       );
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.data}');
//     } on DioException catch (e) {
//       print("-----");
//       print(e.response?.data.toString());
//       print("-----");
//     } catch (e) {
//       log(e.toString());
//     }
//   }
}
