import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tuwaiq_project/data_layer/auth_layer.dart';
import 'package:tuwaiq_project/models/profile_model.dart';
import 'package:tuwaiq_project/networking/networking_constant.dart';
import 'package:tuwaiq_project/services/setup.dart';

mixin ProfileMix on NetworkingConstant {
  Future<ProfileModel> profileGet() async {
    try {
      String token = authLocator.get<AuthLayerData>().auth!.token!;
      final res = await dio.get("$baseUrl$endProfile",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return ProfileModel.fromJson(res.data["data"]);
    } on DioException catch (err) {
      throw err.response?.data ?? 'Unknown error occurred';
    }
  }

  updateProfile(
      {required String firstName,
      required String lastName,
      required List<int>? profileImg,
      required List<int>? cvImg,
      required String bindLink,
      required String linkedinLink,
      required String githubLink}) async {
    try {
      String token = authLocator.get<AuthLayerData>().auth!.token!;
      final res = await dio.put("$baseUrl$endProfileUpdate",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {
            "first_name": firstName,
            "last_name": lastName,
            "image": profileImg,
            "cv": cvImg,
            "accounts": {
              "bindlink": bindLink,
              "linkedin": linkedinLink,
              "github": githubLink
            }
          });
    } on DioException catch (err) {
      throw err.response?.data ?? 'Unknown error occurred';
    }
  }
}
