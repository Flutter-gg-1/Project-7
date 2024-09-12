import 'package:dio/dio.dart';
import 'package:tuwaiq_project/networking/networking_constant.dart';

mixin ProfileMix on NetworkingConstant {
  profileGet({required String token}) async {
    try {


      final res = await dio.get("$baseUrl$endProfile",options: Options(

        headers: {
          'Authorization': 'Bearer $token'
        }
        
      ));


      print(res.data);





    } on DioException catch (err) {
      print(err.response?.data);
    } catch (err) {}
  }
}
