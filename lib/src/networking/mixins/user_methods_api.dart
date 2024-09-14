import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:project_7/src/models/user/user_model.dart';
import 'package:project_7/src/networking/constant_networking.dart';

mixin UserApi on ConstantNetworking {
  /*
  *
  * Method to fetch user profile information
  *
  * */
  Future<UserModel> getUserProfile({required String token}) async {
    if (kDebugMode) {
      log("Iam at getUserProfile");
    }
    try {
      // Construct the API endpoint URL
      final url = '$baseURL$getProfileEndPoint';

      // Send a GET request to the API endpoint with the authentication token
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (kDebugMode) {
        log("${response.statusMessage} ${response.statusCode}");
      }

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response data and create a UserModel object
        final Map<String, dynamic> user = response.data['data'];

        return UserModel.fromJson(user);
      } else {
        // If the request was not successful, throw an exception
        throw Exception('Failed to fetch user profile');
      }
    } on DioException catch (e) {
      // If there was an error while sending the request, throw an exception with the error message
      throw Exception(e.message);
    }
  }

  /*
  *
  * Method to update user profile information
  *
  * */
  Future<UserModel> updateUserProfile(
      {required String token, required UserModel user}) async {
    debugPrint("Iam at UpdateUserProfile");
    final userJson = user.toJson();
    try {
      // Construct the API endpoint URL
      final url = '$baseURL$updateProfileEndPoint';

      // Send a PUT request to the API endpoint with the authentication token and the updated data
      final response = await dio.put(
        url,
        data: userJson,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      debugPrint("${response.statusMessage} ${response.statusCode}");
      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response data and create a UserModel object
        final Map<String, dynamic> updatedData = response.data['data'];
        return UserModel.fromJson(updatedData);
      } else {
        // If the request was not successful, throw an exception
        throw Exception('Failed to update user profile');
      }
    } on DioException catch (e) {
      // If there was an error while sending the request, throw an exception with the error message
      throw Exception(e.message);
    }
  }
}
