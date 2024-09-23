import 'package:dio/dio.dart';
import 'package:project_judge/network/constant_network.dart';

mixin RatingProjectMethod on ConstantNetwork {
  ratePageMethod(
      {required String projectID,
      required int idea,
      required int design,
      required int tools,
      required int practices,
      required int presentation,
      required int investment,
      required String note,
      required String token}) async {
    try {
      await dio.post("$baseurl$ratingProjectEndPoint/$projectID", data: {
        "idea": idea,
        "design": design,
        "tools": tools,
        "practices": practices,
        "presentation": presentation,
        "investment": investment,
        "note": note
      },options: Options(headers: {"Authorization": "Bearer $token"}));
    } on DioException catch (e) {
      throw FormatException(e.response?.data['data']);
    } catch (e){
      throw FormatException(e.toString());
    }
  }
}
