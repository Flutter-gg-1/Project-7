import 'package:project_management_app/networking/constants_api.dart';
import 'package:project_management_app/networking/mixins/admin_api.dart';
import 'package:project_management_app/networking/mixins/auth_api.dart';
import 'package:project_management_app/networking/mixins/profile_api.dart';
import 'package:project_management_app/networking/mixins/public_api.dart';
import 'package:project_management_app/networking/mixins/suppervisor_api.dart';
import 'package:project_management_app/networking/mixins/user_api.dart';

class ApiNetworking extends ConstantsApi
    with AdminApi, AuthApi, ProfileApi, PublicApi, SupervisorApi, UserApi {}
