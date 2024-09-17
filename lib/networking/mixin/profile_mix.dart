// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tuwaiq_project/models/profile_model.dart';
import 'package:tuwaiq_project/networking/networking_constant.dart';

mixin ProfileMix on NetworkingConstant {
  Future<ProfileModel> profileGet({required String token}) async {
    try {
      final res = await dio.get("$baseUrl$endProfile",
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      print(res.data);

      return ProfileModel.fromJson(res.data["data"]);
    } on DioException catch (err) {
      print(err.response?.data);
      throw err.response?.data ?? 'Unknown error occurred';
    } 
    catch (err) {
      print(err);

      throw 'Failed to load profile:';
    }
  }

  updateProfile(
      {required String token,
      required String firstName,
      required String lastName,
      required List<int> profileImg,
      required List<int> cvImg,
      required String bindLink,
      required String linkedinLink,
      required String githubLink}) async {
    try {
      final res = await dio.put("$baseUrl$endProfileUpdate",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {
            "first_name": firstName,
            "last_name": lastName,
            // "image": profileImg,
            // "cv": cvImg,
            "accounts": {
              "bindlink": bindLink,
              "linkedin": linkedinLink,
              "github": githubLink
            }
          });

      log("here");

      print(res.data);
    } on DioException catch (err) {
      // some eorr may be show up
      //  {msg: Error, data: The size of image profile should be less than 500 KB}
      log("here in eorr");
      print(err.response?.data);
    } catch (err) {}
  }
}
