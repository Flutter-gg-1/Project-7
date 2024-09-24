import 'package:dio/dio.dart';


abstract class NetworkingConstant {
  Dio dio = Dio();
  // String? currentToken = authLocator.get<AuthLayerData>().auth!.token;
  final String baseUrl = "https://tuwaiq-gallery.onrender.com/v1";
  final String endCreateUser = "/auth/create/new/account";
  final String endLogin = "/auth/login";

  // after login or regster new user give ottp and emil in body
  final String endVerify = "/auth/verify";

  final String endProfile = "/user/profile";
  final String endProfileUpdate = "/user/update/profile";

  //edit endpoint
  final String endProjectLogoEdit = "/user/edit/project/logo/";
  final String endProjectBaseEdit = "/user/edit/project/base/";
  final String endPresentationEdit = "/user/edit/project/presentation/";
  final String endProjectImgEdit = "/user/edit/project/images/";
  final String endProjectLinksEdit = "/user/edit/project/link/";
  final String endProjectMembersEdit = "/user/edit/project/members/";
  final String endProjectCreate = "/supervisor/create/project";
  final String endProjectChangeState = "/supervisor/change/status/";

  // get end point
  final String endGetAllProject = "/projects";

  //delete and rating endpoint
  final String endProjectDel = "/supervisor/delete/project/";
  final String endProjectRating = "/user/rating/project/";
}
