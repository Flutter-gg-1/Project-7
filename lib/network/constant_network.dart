import 'package:dio/dio.dart';

abstract class ConstantNetwork {
  final dio = Dio();
  final String baseurl = 'https://tuwaiq-gallery.onrender.com/v1';
  final String createAccountEndPoint = '/auth/create/new/account';
  final String verifyAccountEndPoint = '/auth/verify';
}
