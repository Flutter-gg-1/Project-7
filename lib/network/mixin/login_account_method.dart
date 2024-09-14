import 'package:dio/dio.dart';
import 'package:project_judge/network/constant_network.dart';

mixin LoginAccountMethod on ConstantNetwork {
  loginMethod({required String email}) async {
    try {
      await dio.post(baseurl + loginAccountEndPoint, data: {"email": email});
    } on DioException catch (e) {
      throw FormatException("Dio error: ${e.response.toString()}");
    } catch (e){
      throw FormatException(e.toString());
    }
  }
}
