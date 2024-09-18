import 'package:project_judge/network/constant_network.dart';
import 'package:project_judge/network/mixin/create_account_method.dart';
import 'package:project_judge/network/mixin/login_account_method.dart';
import 'package:project_judge/network/mixin/update_profile_method.dart';
import 'package:project_judge/network/mixin/verify_account_method.dart';

class ApiNetowrok extends ConstantNetwork
    with
        CreateAccountMethod,
        VerifyAccountMethod,
        LoginAccountMethod,
        UpdateProfileMethod {}
