import 'package:dio/dio.dart';

abstract class NetworkingConstant {
  Dio dio = Dio();



  final String baseUrl = "https://tuwaiq-gallery.onrender.com/v1";
  final String endCreateUser = "/auth/create/new/account";
  final String endLogin = "/auth/login";

  // after login or regster new user give ottp and emil in body
  final String endVerify = "/auth/verify";

  final String endProfile = "/user/profile";
  final String endProfileUpdate = "/user/update/profile";
  final String endProjectLogoEdit = "/user/edit/project/base/";
  // chnage this data 

  // "project_name" , "bootcamp_name" , type" "start_date" "end_date" "presentation_date" "project_description"
  final String endProjectBaseEdit = "/user/edit/project/base/";



  final String endPresentationEdit = "/user/edit/project/presentation/";
  final String endProjectImgEdit = "/user/edit/project/images/";
  final String endProjectLinksEdit = "/user/edit/project/link/";
  final String endProjectMembersEdit = "/user/edit/project/members/";

}