import 'package:dio/dio.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/models/auth_model.dart';
import 'package:project_judge/network/constant_network.dart';
import 'package:project_judge/setup/init_setup.dart';

mixin VerifyAccountMethod on ConstantNetwork {
  Future<AuthModel> verifyAccount(
      {required String email, required int otp}) async {
    try {
      final response = await dio.post("$baseurl$verifyAccountEndPoint",
          data: {"email": email, "otp": otp});

      AuthModel authUser = AuthModel.fromJson(response.data["data"]);
      getIt.get<DataLayer>().saveUserAuth(auth: authUser);

      return authUser;
    } on DioException catch (e) {
      throw FormatException(e.response?.data['data']);
    } catch (e) {
      throw FormatException("unkown error $e");
    }
  }
}
