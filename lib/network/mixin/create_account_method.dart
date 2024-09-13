import 'package:dio/dio.dart';
import 'package:project_judge/network/constant_network.dart';

mixin CreateAccountMethod on ConstantNetwork {
  Future<String> createAccount(
      {required String email,
      required String fName,
      required String lName}) async {
    try {
      final response = await dio.post("$baseurl$createAccountEndPoint",
          data: {"email": email, "f_name": fName, "l_name": lName});
      return response.data['data']['email'];
    } on DioException catch (e) {
      throw FormatException(e.response?.data['data']);
    } catch (e) {
      throw FormatException("unkown error $e");
    }
  }
}
