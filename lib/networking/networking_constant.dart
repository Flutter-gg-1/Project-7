import 'package:dio/dio.dart';

abstract class NetworkingConstant {
  Dio dio = Dio();



  final String baseUrl = "https://tuwaiq-gallery.onrender.com/v1";
  final String endCreateUser = "/auth/create/new/account";
  final String endLogin = "/auth/login";

  // after login or regster new user give ottp and emil in body
  final String endVerify = "/auth/verify";

  final String endProfile = "/user/profile";


  
}