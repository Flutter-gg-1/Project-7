import 'package:dio/dio.dart';

abstract class ConstantNetwork {
  final dio = Dio();
  final String baseurl = 'https://tuwaiq-gallery.onrender.com/v1';
  final String createAccountEndPoint = '/auth/create/new/account';
  final String loginAccountEndPoint = '/auth/login';
  final String verifyAccountEndPoint = '/auth/verify';
  final String resendOTPEndPoint = '/auth/resend';
  final String getProfileEndPoint = '/user/profile';
  final String getFirstHundredProjectsEndPoint = '/projects';
  final String updateProjectLogoEndPoint = '/project/logo';
  final String updateProjectBaseEndPoint = '/project/base';
  final String updateProjectImagesEndPoint = '/project/images';
  final String updateProjectPresentationEndPoint = '/project/presentation';
  final String updateProjectLinksEndPoint = '/project/link';
  final String updateProjectMembersEndPoint = '/project/members';
}
