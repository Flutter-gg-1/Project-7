import 'package:dio/dio.dart';
import 'package:project_judge/network/constant_network.dart';

mixin CreateAccountMethod on ConstantNetwork {
  Future<void> createAccount(
      {required String email,
      required String fName,
      required String lName}) async {
    try {
      await dio.post("$baseurl$createAccountEndPoint",
          data: {"email": email, "f_name": fName, "l_name": lName});
    } on DioException catch (e) {
      throw FormatException(e.response?.data['data']);
    } catch (e) {
      throw FormatException("unkown error $e");
    }
  }
    

}
