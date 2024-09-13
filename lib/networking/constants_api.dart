import 'package:dio/dio.dart';

abstract class ConstantsApi {
    final dio = Dio();

  final String baseUrl = 'https://tuwaiq-gallery.onrender.com';

  // Auth
  final String creatAccountEndpoint = '/v1/auth/create/new/account';
  final String loginEndpoint = '/v1/auth/login';
  final String verifyEndpoint = '/v1/auth/verify';
  final String resendOtpEndpoint = '/v1/auth/resend';

  // Profile
  final String getProfileEndpoint = '/v1/auth/profile';
  final String updateProfileEndpoint = '/v1/auth/update/profile';

  // Admin
  final String changeRoleEndpoint = '/v1/admin/change/role/user';

  // User
  final String rateProjectEndpoint = '/v1/user/rating/project';
  final String editProjectLogoEndpoint = '/v1/user/edit/project/logo';
  final String editProjectInfoEndpoint = '/v1/user/edit/project/base';
  final String editPresentationEndpoint = '/v1/user/edit/project/presentation';
  final String editProjectImageEndpoint = '/v1/user/edit/project/images';
  final String editProjectLinksEndpoint = '/v1/user/edit/project/link';
  final String editProjectMembersEndpoint = '/v1/user/edit/project/members';

  // Supervisor
  final String createProjectEndpoint = '/v1/supervisor/create/project';
  final String changeProjectStatusEndpoint = '/v1/supervisor/change/status';
  final String deleteProjectEndpoint = '/v1/supervisor/delete/project';

  // Public
  final String getProjectEndpoint = '/v1/project';
  final String getProjectsListEndpoint = '/v1/projects';
}
