import 'package:tuwaiq_project/networking/mixin/auth_method_api.dart';
import 'package:tuwaiq_project/networking/mixin/profile_mix.dart';
import 'package:tuwaiq_project/networking/mixin/supervisor_mix.dart';
import 'package:tuwaiq_project/networking/networking_constant.dart';

class NetworkingApi extends NetworkingConstant with AuthMethodApi , ProfileMix ,SupervisorMix{
  
}