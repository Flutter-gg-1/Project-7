import 'package:dio/dio.dart';
import 'package:project_management_app/models/link_model.dart';
import 'package:project_management_app/models/profile_model.dart';
import 'package:project_management_app/networking/constants_api.dart';

mixin ProfileApi on ConstantsApi {

   Future<Profile> getProfile(String token) async {
    try {
      final response = await dio.get(
        baseUrl + getProfileEndpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return Profile.fromJson(response.data["data"]);
    } on DioException catch (error) {
      throw FormatException(error.response?.data["data"]);
    } catch (error) {
      throw const FormatException("Error occurred while getting profile");
    }
  }
  
  
  Future<void> updateProfile({
    required String token,
    required String firstName,
    required String lastName,
    List<int>? image,
    List<int>? cv,
    required LinkModel accounts,
  }) async {
    try {
      await dio.put(
        baseUrl + updateProfileEndpoint,
        data: {
          "first_name": firstName.trim(),
          "last_name": lastName.trim(),
          "image": image,
          "cv": cv,
          "accounts": accounts.toJson(),
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioException catch (error) {
      throw FormatException(error.response?.data["data"]);
    } catch (error) {
      throw const FormatException("Error occurred while updating profile");
    }
  }
}
