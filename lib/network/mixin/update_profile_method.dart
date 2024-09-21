import 'package:dio/dio.dart';
import 'package:project_judge/network/constant_network.dart';

mixin UpdateProfileMethod on ConstantNetwork {
  updateProfile(
      {required String token,
      required String first_name,
      required String last_name,
      required String bindlink,required List<int> img}) async {
    try {
      await dio.put("$baseurl/user/update/profile",
          data: {
            "first_name": first_name,
            "last_name": last_name,
            "image": img,
            "cv": null,
            "accounts": {
              "bindlink": bindlink,
              "linkedin": "rahaf-alshahrani-20bb67239",
              "github": "mohammed_19994",
              "resume": "okooijiojoko"
            }
          },
          options: Options(headers: {"Authorization": "Bearer $token"}));
    } on DioException catch (e) {
      throw FormatException(e.response?.data['data']);
    } catch (e) {
      throw FormatException(e.toString());
    }
  }
}
