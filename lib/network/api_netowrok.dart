import 'package:project_judge/network/constant_network.dart';
import 'package:project_judge/network/mixin/create_account_method.dart';
import 'package:project_judge/network/mixin/create_project_methid.dart';
import 'package:project_judge/network/mixin/login_account_method.dart';
import 'package:project_judge/network/mixin/project_details.dart';
import 'package:project_judge/network/mixin/rating_project_method.dart';
import 'package:project_judge/network/mixin/update_profile_method.dart';
import 'package:project_judge/network/mixin/update_project_methods.dart';
import 'package:project_judge/network/mixin/verify_account_method.dart';

class ApiNetowrok extends ConstantNetwork
    with
        CreateAccountMethod,
        VerifyAccountMethod,
        LoginAccountMethod,
        UpdateProfileMethod,
        UpdateProjectMethods,
        ProjectDetails,
        CreateProjecttMethod, RatingProjectMethod {}
