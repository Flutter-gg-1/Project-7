import 'package:dio/dio.dart';

abstract class ConstantNetwork {
  final dio = Dio();
  final String baseurl = 'https://tuwaiq-gallery.onrender.com/v1';
  final String createAccountEndPoint = '/auth/create/new/account';
  final String loginAccountEndPoint = '/auth/login';
  final String verifyAccountEndPoint = '/auth/verify';
  final String resendOTPEndPoint = '/auth/resend';
  final String getProfileEndPoint = '/user/profile';
  final String updateProjectLogoEndPoint = '/user/edit/project/logo';
  final String updateProjectBaseEndPoint = '/user/edit/project/base';
  final String updateProjectImagesEndPoint = '/user/edit/project/images';
  final String updateProjectPresentationEndPoint =
      '/user/edit/project/presentation';
  final String updateProjectLinksEndPoint = '/user/edit/project/link';
  final String updateProjectMembersEndPoint = '/user/edit/project/members';
  final String getFirstHundredProjectsEndPoint = '/projects';
  final String ratingProjectEndPoint = '/user/rating/project';
  final String supervisorCreate = 'supervisor/create/project';
   final String delete ='/supervisor/delete/project';
}
