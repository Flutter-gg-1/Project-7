import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:project_judge/network/constant_network.dart';

mixin UpdateProfileMethod on ConstantNetwork {
  updateProfile(
      {required String token,
      required String firstName,
      required String lastName,
      required String linkedin,
      required String github,
      required String bindlink,
      required String img,
      required String cv}) async {
    try {
      Uint8List imgdata = await File(img).readAsBytes();

      Uint8List cvdata = await File(cv).readAsBytes();

       await dio.put("$baseurl/user/update/profile",
          data: {
            "first_name": firstName,
            "last_name": lastName,
            "image": imgdata.toList(growable: false),
            "cv": cvdata.toList(growable: false),
            "accounts": {
              "bindlink": bindlink,
              "linkedin": linkedin,
              "github": github
            }
          },
          options: Options(headers: {"Authorization": "Bearer $token"}));
    } on DioException catch (e) {
      print('dio $e');
      throw FormatException(e.response?.data['data']);
    } catch (e) {
      print('error $e');
      throw FormatException(e.toString());
    }
  }
}
